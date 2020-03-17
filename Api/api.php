<?php
    header('Access-Control-Allow-Origin: *');
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE");
	require_once("Rest.inc.php");
	
	class API extends REST {
		public $data = "";
		public function __construct(){
			parent::__construct();
			date_default_timezone_set('Asia/Kolkata');	
			
						// Init parent contructor
		}

		protected function register(){
			// Cross validation if the request method is POST else it will return "Not Acceptable" status
			if($this->get_request_method() != "POST"){
				$this->response('',406);
			}
			
			if(!empty($this->_request['email']) && !empty($this->_request['registertype'])){
               
				$check_info = array(
						'fields'=>'id,email',
						'where'=>'email ="'.$this->_request['email'].'"'
					);

				$exist_email = $this->GetSingleRecord("kvt_customers",$check_info);
                 
				if(count($exist_email)>0) {
					$response_array['status']='fail';
					$response_array['message']='Email already exists.';
					//$response_array['data']='';
					$this->response($this->json($response_array), 200);
 				} else {

 					if ($this->_request['registertype'] == '1') {
 						$tokenNo = mt_rand(100000,999999); 
 						$info_array = array(
							'firstname'=>$this->_request['firstname'],
							'lastname'=>$this->_request['lastname'],
							'email'=>$this->_request['email'],
							'password'=>sha1($this->_request['password']),
							'normal_password'=>$this->_request['password'],
							'LoginType'=>$this->_request['registertype'],
							'isDeleted '=>0,
							'tokenCode '=>$tokenNo,
							'emailStatus '=>'N',
							'registeredOn'=>strtotime(date("Y-m-d H:i:s"))
						);
 					}elseif($this->_request['registertype'] == '2' || $this->_request['registertype'] == '3'){
 						$info_array = array(
							'oauth_provider'=>$this->_request['oauth_provider'],
							'oauth_id'=>$this->_request['oauth_id'],
							'firstname'=>$this->_request['firstname'],
							'lastname'=>$this->_request['lastname'],
							'email'=>$this->_request['email'],
							'LoginType'=>$this->_request['registertype'],
							'isDeleted '=>0,
							'emailStatus '=>'Y',
							'registeredOn'=>strtotime(date("Y-m-d H:i:s"))
						);
 					}
					
					//$this->response($this->json($info_array), 200);		
					$user_id = $this->InsertRecord("kvt_customers",$info_array);
                   
					if($user_id>0) {

                        if ($this->_request['registertype'] == '1') {
						   	 
							$message = 'Hi '.$this->_request['firstname'].',<br>  IND Spritual email verification OTP is '.$tokenNo;
							   $this->SendMail($this->_request['email'],'IND Spritual Email Verification',$message);
						 

                            $response_array['status']  = 'verification';
							$response_array['message'] = 'Need to verify you email';
					
                        }else{

                        	$check_info = array(
							   'fields'=>'id,firstname,lastname,email',
							   'where'=>'id ="'.$user_id.'"'
						    );

						    $regData = $this->GetSingleRecord("kvt_customers",$check_info);

						    $response_array['status']  = 'success';
							$response_array['message'] = 'Register successfully';
							$response_array['data']    =  $regData;
                        }
                        
						$this->response($this->json($response_array), 200);

					} else {
						$response_array['status']  = 'fail';
						$response_array['message'] = 'insufficient data.';
						$response_array['data']    = '';
						$this->response($this->json($response_array), 204);
					}
				}
			}else{
				$response_array['status']  = 'fail';
				$response_array['message'] = 'field is mising.';
				
				$this->response($this->json($response_array), 400);
			}
		}

		protected function login(){
			// Cross validation if the request method is POST else it will return "Not Acceptable" status
			if($this->get_request_method() != "POST"){
				$this->response('',406);
			}
			
			$email = $this->_request['email'];		
			$password = $this->_request['password'];
			$loginType = $this->_request['loginType'];
			$oauth_id = $this->_request['oauth_id'];
			$oauth_provider = $this->_request['oauth_provider'];

			if(!empty($email) && !empty($loginType)){

                if($loginType == '1' && !empty($password)) {
                  	
                	$info_array = array(
						"fields"=>"*",
						"where"=>"email = '".$email."' and password = '".sha1($password)."' and isDeleted = '0'"
					);
                
				    $user_data = $this->GetSingleRecord("kvt_customers",$info_array);

				    if (count($user_data) > 0 ) {
				    	
				    	if ($user_data['emailStatus'] == 'N') {

                            $message = 'Hi '.$user_data['firstname'].',<br>  IND Spritual email verification OTP is '.$user_data['tokenCode'];
							   $this->SendMail($user_data['email'],'IND Spritual Email Verification',$message);

				    		$response_array['status']  = 'verification';
							$response_array['message'] = 'Need to verify you email';
							$this->response($this->json($response_array), 200);

				    	}elseif($user_data['emailStatus'] == 'Y'){
				    		$userDataArr = array(
				    			'sessionid' => $user_data['id'],
				    			'firstname' => $user_data['firstname'],
				    			'lastname' => $user_data['lastname'],
				    			'email' => $user_data['email'],
				    			'image' => $user_data['image']
			
				    		);

 							$response_array['status']='success';
							$response_array['message']='logged in successfully.';
							$response_array['data']=$userDataArr;
							$this->response($this->json($response_array), 200);
				    	}
				    }else {
					    $response_array['status']='fail';
					    $response_array['message']='Invalid email or password.';
					    $response_array['data']='';
					    $this->response($this->json($response_array));
				   } 
                   // print_r($user_data); exit();
                 }elseif(($loginType == '2' || $loginType == '3') && !empty($oauth_id)) {
                   
                 	$info_array = array(
						"fields"=>"*",
						"where"=>"email = '".$email."'"
					);

					$userCheck_data = $this->GetSingleRecord("kvt_customers",$info_array);
  					$userCount = count($userCheck_data);
  					
                    if($userCount <=0){
                    	
                    	$info_array = array(
							'oauth_provider'=>$this->_request['oauth_provider'],
							'oauth_id'=>$this->_request['oauth_id'],
							'firstname'=>$this->_request['firstname'],
							'lastname'=>$this->_request['lastname'],
							'email'=>$this->_request['email'],
							'password'=>sha1($this->_request['password']),
							'normal_password'=>$this->_request['password'],
							'LoginType'=>$this->_request['loginType'],
							'isDeleted '=>0,
							'registeredOn'=>strtotime(date("Y-m-d H:i:s"))
						);

						$user_id = $this->InsertRecord("kvt_customers",$info_array);
                        
                        if($user_id>0) {
	                        $check_info = array(
							   "fields"=>"*",
							   'where'=>'id ="'.$user_id.'"'
						    );
							$user_data = $this->GetSingleRecord("kvt_customers",$check_info);
					    }else{
                            $response_array['status']  = 'error';
							$response_array['message'] = 'Connection issue, Please try again';
							$response_array['data']    = '';
							$this->response($this->json($response_array), 204);
					    }
                    }elseif($userCount >0){
                    	
                        $user_data = $userCheck_data;
                    }

                    if(count($user_data)>0) {
                 	
						$response_array['status']='success';
						$response_array['message']='logged in successfully.';
						$response_array['data']=$user_data;
						$this->response($this->json($response_array), 200);
					 } else {
						    $response_array['status']='fail';
						    $response_array['message']='Invalid email or password.';
						    $response_array['data']='';
						    $this->response($this->json($response_array));
					 }

                 } 
                       
			}else{

				// If invalid inputs "Bad Request" status message and reason
				$error = array('status' => "failed", "msg" => "Invalid data");
				$this->response($this->json($error), 400);
			}
			
		}

		protected function emailVerification(){

			if($this->get_request_method() != "POST"){
				$this->response('',406);
			}

			if (!empty($this->_request['email']) && !empty($this->_request['token'])) {
				
 				$info_array = array(
					"fields"=>"*",
					"where"=>"email = '".$this->_request['email']."' and tokenCode = '".$this->_request['token']."' "
				);

				$verify_Data = $this->GetSingleRecord("kvt_customers",$info_array);
              
                if (count($verify_Data)>0) {
                	$update_array = array(
						"emailStatus"=>'Y',
					);
					$where = "email = '".$this->_request['email']."' and tokenCode = '".$this->_request['token']."' ";

					$recUpdated = $this->UpdateRecord('kvt_customers', $update_array, $where);

					if ($recUpdated>0) {
						$response_array['status']='success';
						$response_array['message']='Verified successfully.';
						$this->response($this->json($response_array), 200);
					}else{
						$response_array['status']='fail';
						$response_array['message']='Data Not Updated, Please try again';
						$this->response($this->json($response_array), 200);
					}
                }else{
                	$response_array['status']='error';
					$response_array['message']='Invalid Token number';
					$this->response($this->json($response_array), 200);
                }
			}else{

				$error = array('status' => "failed", "msg" => "Invalid data");
				$this->response($this->json($error), 400);

			}
		}

		protected function getuserprofile(){

			if($this->get_request_method() != "POST"){
				$this->response('',406);
			}
	
			if (!empty($this->_request['sessionid'])) {
                $info_array = array(
					"fields"=>"*",
					"where"=>"id = '".$this->_request['sessionid']."' and isDeleted = '0'"
				);

				$Profile_Data = $this->GetSingleRecord("kvt_customers",$info_array);

				if (count($Profile_Data)>0) {
			
					$response_array['status']='success';
					$response_array['data']=array(
						'title'=>$Profile_Data['title'],
						'firstname'=>$Profile_Data['firstname'],
						'lastname'=>$Profile_Data['lastname'],
						'email'=>$Profile_Data['email'],
						'phone'=>$Profile_Data['phone'],
						'gender'=>$Profile_Data['gender'],
						'date_of_birth'=>$Profile_Data['date_of_birth'],
						'place_of_birth'=>$Profile_Data['place_of_birth'],
						'time_of_birth'=>$Profile_Data['time_of_birth'],
						'marital_status'=>$Profile_Data['marital_status'],
						'address'=>$Profile_Data['address'],
						'zip'=>$Profile_Data['zip'],
						'country'=>$Profile_Data['country'],
						'message'=>$Profile_Data['message'],
						'image'=>$Profile_Data['image'],
						'path'=>'',
					);
					$this->response($this->json($response_array), 200);
				}else{
					$error = array('status' => "error", "msg" => "Data does not exist");
				    $this->response($this->json($error), 404);
				}
			}else{
				$error = array('status' => "failed", "msg" => "Invalid data");
				$this->response($this->json($error), 400);
			}

		}

		protected function updateUserProfile(){

            if($this->get_request_method() != "POST"){
				$this->response('',406);
			}

			if (!empty($this->_request['sessionid'])) {

				    $info_array = array(
					    'title'=>$this->_request['title'],
						'firstname'=>$this->_request['firstname'],
						'lastname'=>$this->_request['lastname'],
						'phone'=>$this->_request['phone'],
						'gender'=>$this->_request['gender'],
						'date_of_birth'=>$this->_request['date_of_birth'],
						'place_of_birth'=>$this->_request['place_of_birth'],
						'time_of_birth'=>$this->_request['time_of_birth'],
						'marital_status'=>$this->_request['marital_status'],
						'address'=>$this->_request['address'],
						'zip'=>$this->_request['zip'],
						'country'=>$this->_request['country'],
						'message'=>$this->_request['message'],
						'updatedOn'=>strtotime(date("Y-m-d H:i:s"))
					);

			     	$upWhere = "id = '".$this->_request['sessionid']."' and isDeleted = '0'";
			     	 
				    $updatedData = $this->UpdateRecord("kvt_customers",$info_array,$upWhere);
                      // print_r($updatedData); exit();   
                	$Check_array = array(
                		"fields"=>"*",
					    "where"=>"id = '".$this->_request['sessionid']."' and isDeleted = '0'"
                	);

                	$Profile_Data = $this->GetSingleRecord("kvt_customers",$Check_array);

                	if (count($Profile_Data)>0) {
					//print_r($Profile_Data); exit();
						$response_array['status']='success';
						$response_array['data']=array(
							'title'=>$Profile_Data['title'],
							'firstname'=>$Profile_Data['firstname'],
							'lastname'=>$Profile_Data['lastname'],
							'email'=>$Profile_Data['email'],
							'phone'=>$Profile_Data['phone'],
							'gender'=>$Profile_Data['gender'],
							'date_of_birth'=>$Profile_Data['date_of_birth'],
							'place_of_birth'=>$Profile_Data['place_of_birth'],
							'time_of_birth'=>$Profile_Data['time_of_birth'],
							'marital_status'=>$Profile_Data['marital_status'],
							'address'=>$Profile_Data['address'],
							'zip'=>$Profile_Data['zip'],
							'country'=>$Profile_Data['country'],
							'message'=>$Profile_Data['message'],
							'image'=>$Profile_Data['image'],
							'path'=>'',
					 	);
					    $this->response($this->json($response_array), 200);
				    }
                }else{
                	$error = array('status' => "failed", "msg" => "Invalid data");
				    $this->response($this->json($error), 400);
                }
          
		}

		protected function updateUserProfImg(){

			if($this->get_request_method() != "POST"){
				$this->response('',406);
			}

			if (!empty($this->_request['sessionid']) && !empty($_FILES['image']) && $_FILES['image']['size'] > 0) {
                
                $fileInfo = array(
                	'uploadpath'=>'kvt_api/uploads/profile/',
                	'filetype'=>['jpeg','jpg','png']
                );
              
                $upload_files = $this->UploadFile($_FILES['image'],$fileInfo);
         
                if ($upload_files>0) {
                	$upInfo = array(
                		'image'=>$upload_files[0],
                	);
                	$upWhere = "id = '".$this->_request['sessionid']."' and isDeleted = '0'";
                	$updatedData = $this->UpdateRecord("kvt_customers",$upInfo,$upWhere);
                    
                    $info_array = array(
					   "fields"=>"image",
					   "where"=>"id = '".$this->_request['sessionid']."' and isDeleted = '0'"
				    );

				    $ProfileImage = $this->GetSingleRecord("kvt_customers",$info_array);
				    if (count($ProfileImage)>0) {
					//print_r($Profile_Data); exit();
						$response_array['status']='success';
						$response_array['data']=array(
							'image'=>$ProfileImage['image'],
							'path'=>'https://dev.eighteenpixels.in/kvt_api/Api/class'
					 	);
					    $this->response($this->json($response_array), 200);
				    }
                }else{
                	$error = array('status' => "failed", "msg" => "Not Uploaded");
				    $this->response($this->json($error), 404);
                }

			}else{

				$error = array('status' => "failed", "msg" => "Invalid data");
				$this->response($this->json($error), 400);

			}

		}

		protected function getpojaType(){

			if($this->get_request_method() != "GET"){
				$this->response('',406);
			}

			$info_array = array(
						"fields"=>"*",
						"where"=>"status = '1'"
					);

			$dataPooja = $this->GetSingleRecord("kvt_poja_type",$info_array);

			if (count($dataPooja)>0) {
				$response_array['status']='success';
				$response_array['data']=array('poojaId'=>$dataPooja['id'],'title'=>$dataPooja['title'],'shortDescription'=>$dataPooja['excerpt'], 'description'=>$dataPooja['description'],'no_of_shastri'=>$dataPooja['no_of_shastri'], 'duration'=>$dataPooja['duration'], 'start_time'=>$dataPooja['start_time'], 'end_time'=>$dataPooja['end_time'], 'price_inr'=>$dataPooja['price_inr'], 'price_dollar'=>$dataPooja['price_dollar'],);
				$this->response($this->json($response_array), 200);
			}else{
				$response_array['status']='error';
				$response_array['message']='Record not found.';
				$this->response($this->json($response_array), 204);
			}

		}



		protected function getcountry(){

			if($this->get_request_method() != "GET"){
				$this->response('',406);
			}

			$info_array = array(
						"fields"=>"name, phonecode",
						"where"=>"countryStatus = '1'",
						"ordertype"=>"asc",
						"orderby"=>"name"
					);

			$dataCountry = $this->GetRecord("kvt_countries",$info_array);

			if (count($dataCountry)>0) {
				$response_array['status']='success';
				$response_array['data']=$dataCountry;
				$this->response($this->json($response_array), 200);
			}else{
				$response_array['status']='error';
				$response_array['message']='Record not found.';
				$this->response($this->json($response_array), 204);
			}

		}

		protected function checkoutBooking(){
			if ($this->get_request_method() != "POST") {
				$this->response('',406);
			}

			if (!empty($this->_request['sessionid']) && !empty($this->_request['paymentStatus'])) {
				
                $infoBooking = array(
                    'booking_id'=>$this->_request['sessionid'].time(),
					'customer_id'=>$this->_request['sessionid'],
					'pooja_id'=>$this->_request['poojaId'],
					'booking_start_datetime'=>$this->_request['poojaDate'],
					'poojatimeslot'=>$this->_request['poojatimeslot'],
					'name_title'=>$this->_request['personal_title'],
					'first_name'=>$this->_request['personal_firstname'],
					'last_name'=>$this->_request['personal_lastname'],
					'birth_date'=>$this->_request['personal_date_of_birth'],
					'birth_place'=>$this->_request['personal_place_of_birth'],
					'birth_time'=>$this->_request['personal_time_of_birth'],
					'gender'=>$this->_request['personal_gender'],
					'marital_status'=>$this->_request['personal_marital_status'],
					'message'=>$this->_request['personal_message'],
					'booking_status'=>'1',
					'addedOn'=>time(),
                );
                
                $bookingData = $this->InsertRecord("kvt_bookings",$infoBooking);
         
                if ($bookingData>0) {
                	$infoOrder = array(
	                    'order_id'=>'OD'.$this->_request['sessionid'].time(),
	                    'booking_id'=>$bookingData['id'],
						'customer_id'=>$bookingData['customer_id'],
						'shipping_firstname'=>$this->_request['shipping_firstname'],
						'shipping_lastname'=>$this->_request['shipping_lastname'],
						'shipping_address'=>$this->_request['shipping_address'],
						'shipping_zip'=>$this->_request['shipping_zip'],
						'shipping_phone'=>$this->_request['shipping_phone'],
						'shipping_country'=>$this->_request['shipping_country'],
						'billing_firstname'=>$this->_request['billing_firstname'],
						'billing_lastname'=>$this->_request['billing_lastname'],
						'billing_phone'=>$this->_request['billing_phone'],
						'billing_address'=>$this->_request['billing_address'],
						'billing_zip'=>$this->_request['billing_zip'],
						'billing_country'=>$this->_request['billing_country'],
						'status'=>'1',
						'created'=>time(),
	                );
                
                    $orderData = $this->InsertRecord("kvt_orders",$infoOrder);
                    
                    if($orderData> 0){
                        	$infoPayment = array(
	                		'payment_id'=>$this->_request['payerId'],
	                		'orderId'=>$this->_request['orderId'],
	                		'payment_mode'=>$this->_request['paymentMethod'],
	                		'booking_id'=>$orderData['booking_id'],
	                		'customer_id'=>$orderData['customer_id'],
	                		'payerName'=>$this->_request['payerName'],
	                		'payerPhone'=>$this->_request['payerPhone'],
	                		'amount'=>$this->_request['paymentAmount'],
	                		'currencyCode'=>$this->_request['currencyCode'],
	                		'created'=>time(),
	                		'status'=>'1'
	                	);
	                	$PaymentData = $this->InsertRecord("kvt_payments",$infoPayment);
	                	if($paymentData>0){
	                	    $response_array['status']='success';
    						$response_array['data']=array(
    							'booking_id'=>$bookingData['booking_id'],
    							'meeting_link'=>$bookingData['meeting_link'],
    							'booking_status'=>$bookingData['booking_status'],
    							'booking_date'=>$bookingData['booking_start_datetime'],
    							'pooja_timeslot'=>$bookingData['poojatimeslot']
    					 	);
    					    $this->response($this->json($response_array), 200);
	                	}
                    }
	                // if (count($orderData)>0) {
	                
	                // }
                }else{

                }
              

			}else{
				$response_array['status']='failed';
				$response_array['message']='Invalid data';
				$this->response($this->json($response_array), 400);
			}

		}
		

		protected function users(){	
			// Cross validation if the request method is GET else it will return "Not Acceptable" status
			if($this->get_request_method() != "GET"){
				$this->response('',406);
			}

			$info_array = array(
						"fields"=>"user_id,firstname,lastname,email,active_status"
					);
			$user_data = $this->GetRecord("user_master",$info_array);

			if(count($user_data)>0) {
				$response_array['status']='success';
				$response_array['message']='Total '.count($user_data).' record(s) found.';
				$response_array['total_record']= count($user_data);
				$response_array['data']=$user_data;
				$this->response($this->json($response_array), 200);
			} else {
				$response_array['status']='fail';
				$response_array['message']='Record not found.';
				$response_array['data']='';
				$this->response($this->json($response_array), 204);
			}
		}

		protected function deleteuser(){
			// Cross validation if the request method is DELETE else it will return "Not Acceptable" status
			if($this->get_request_method() != "DELETE"){
				$this->response('',406);
			}
			$id = (int)$this->_request['id'];
			if($id > 0){
				$where = "user_id = '".$id."'";
				$delete = $this->DeleteRecord("user_master",$where);

				if($delete>0) {
					$response_array['status']='success';
					$response_array['message']='Total '.count($delete).' record(s) Deleted.';
					$response_array['data']=$delete;
					$this->response($this->json($response_array), 200);
				} else {
					$response_array['status']='fail';
					$response_array['message']='no record deleted';
					$response_array['data']='';
					$this->response($this->json($response_array), 200);
				}
			} else {
				$this->response('',204);	// If no records "No Content" status
			}
		}
	}
	// Initiiate Library
	$api = new API();
	$api->processApi();
?>