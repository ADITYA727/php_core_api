<?php 
session_start();

/* Include class files */
include(dirname(dirname(dirname(__FILE__)))."/constants.php");
include(dirname(dirname(dirname(__FILE__)))."/classes/class_settings.php");
include(dirname(dirname(dirname(__FILE__)))."/classes/class_bookings.php");
include(dirname(dirname(dirname(__FILE__)))."/classes/class_addons.php");

/* Create object of classes */
$obj_settings = new rzvy_settings();
$obj_settings->conn = $conn;
$obj_bookings = new rzvy_bookings();
$obj_bookings->conn = $conn;
$obj_addons = new rzvy_addons();
$obj_addons->conn = $conn;

$rzvy_currency_symbol = $obj_settings->get_option('rzvy_currency_symbol');
$rzvy_date_format = $obj_settings->get_option('rzvy_date_format');
$rzvy_time_format = $obj_settings->get_option('rzvy_time_format');
$rzvy_datetime_format = $rzvy_date_format." ".$rzvy_time_format;
$export_path = SITE_URL."/uploads/csv/";
$export_abs_path = dirname(dirname(dirname(__FILE__)))."/uploads/csv/";

/** Condition to export all appointments details **/
if(isset($_POST['export_appointments'])){
	$filename = base64_encode("all_appointments").".csv";
	$filepath = $export_abs_path.$filename;
	$exported_file = $export_path.$filename;
	$file = fopen($filepath, "w");
	$header = array(
		"#",
		"Category",
		"Service",
		"Addons",
		"Booking Start Time",
		"Booking End Time",
		"Booking Status",
		"Reschedule Reason",
		"Reject Reason By You",
		"Cancellation Reason By Customer",
		"Customer FirstName",
		"Customer LastName",
		"Customer Email",
		"Customer Phone",
		"Customer Address",
		"Customer City",
		"Customer State",
		"Customer Country",
		"Customer Zip",
		"Payment Method",
		"Payment Date",
		"Transaction ID",
		"Sub Total",
		"Discount",
		"Tax",
		"Net Total",
		"Frequently Discount",
		"Frequently Discount Amount",
		"Order Date",
		"Customer Type"
	);
	fputcsv($file, $header);
	
	$start = $_POST['from_date'];
	$end = $_POST['to_date'];
	if($_POST['appt_type'] == "registered"){
		$all_appointments = $obj_bookings->all_registered_customers_appointments($start, $end);
	}else if($_POST['appt_type'] == "guest"){
		$all_appointments = $obj_bookings->all_guest_customers_appointments($start, $end);
	}else{
		$all_appointments = $obj_bookings->get_all_customers_appointments($start, $end);
	}
	
	while($appointment = mysqli_fetch_assoc($all_appointments)){
		$appointment['c_firstname'] = ucwords($appointment['c_firstname']);
		$appointment['c_lastname'] = ucwords($appointment['c_lastname']);
		$appointment['booking_datetime'] = date($rzvy_datetime_format, strtotime($appointment['booking_datetime']));
		$appointment['booking_end_datetime'] = date($rzvy_datetime_format, strtotime($appointment['booking_end_datetime']));
		
		$flag = true;
		$addons_detail = '';
		$unserialized_addons = unserialize($appointment['addons']);
		foreach($unserialized_addons as $addon){
			$obj_addons->id = $addon['id'];
			$addon_name = $obj_addons->get_addon_name();
			if($flag){
				$addons_detail .= $addon['qty']." ".$addon_name." of ".$rzvy_currency_symbol.$addon['rate'];
				$flag = false;
			}else{
				$addons_detail .= ", ".$addon['qty']." ".$addon_name." of ".$rzvy_currency_symbol.$addon['rate'];
			}
		}
		$appointment['title'] = $appointment['title']." of ".$rzvy_currency_symbol.$appointment['service_rate'];
		unset($appointment['service_rate']);
		
		$appointment['addons'] = $addons_detail;
		$appointment['booking_status'] = strtoupper(str_replace('_', ' ', $appointment['booking_status']));
		
		$appointment['payment_method'] = ucwords($appointment['payment_method']);
		$appointment['payment_date'] = date($rzvy_date_format, strtotime($appointment['payment_date']));
		$appointment['sub_total'] = $rzvy_currency_symbol.$appointment['sub_total'];
		$appointment['discount'] = $rzvy_currency_symbol.$appointment['discount'];
		$appointment['tax'] = $rzvy_currency_symbol.$appointment['tax'];
		$appointment['net_total'] = $rzvy_currency_symbol.$appointment['net_total'];
		$appointment['fd_key'] = strtoupper($appointment['fd_key']);
		$appointment['fd_amount'] = $rzvy_currency_symbol.$appointment['fd_amount'];
		$appointment['order_date'] = date($rzvy_date_format, strtotime($appointment['order_date']));
		if($appointment['customer_id'] == 0){
			$appointment['customer_id'] = "Guest";
		}else{
			$appointment['customer_id'] = "Registered";
		}
		if($appointment['reschedule_reason'] == ""){
			$appointment['reschedule_reason'] = "-";
		}
		if($appointment['reject_reason'] == ""){
			$appointment['reject_reason'] = "-";
		}
		if($appointment['cancel_reason'] == ""){
			$appointment['cancel_reason'] = "-";
		}
		
		fputcsv($file, $appointment);
	}
	echo $exported_file;
}