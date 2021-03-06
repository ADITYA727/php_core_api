<?php 

class rzvy_appointment_cron{

	public $conn;

	public $rzvy_bookings = 'kvt_bookings';

	

	/* Function to get all appointments detail */

	public function get_all_business_appointments(){

		$selection = '`b`.`order_id`, `b`.`booking_datetime`';

		$after_date = date('Y-m-d 00:00:00', strtotime('-1 day'));

		$query = "select ".$selection." from `".$this->rzvy_bookings."` as `b` where `b`.`reminder_status` = 'N' and (`b`.`booking_status` = 'confirmed' or `b`.`booking_status` = 'confirmed_by_staff' or `b`.`booking_status` = 'rescheduled_by_customer' or `b`.`booking_status` = 'rescheduled_by_you' or `b`.`booking_status` = 'rescheduled_by_staff') and `b`.`booking_datetime`>'".$after_date."'";

		$result=mysqli_query($this->conn,$query);

		return $result;

	}

		

	/* Function to change appointment reminder status */

	public function change_appointment_reminder_status($order_id){

		$query = "update `".$this->rzvy_bookings."` set `reminder_status` = 'Y' where `order_id`='".$order_id."'";

		$result=mysqli_query($this->conn,$query);

		return $result;

	}

}  

?>