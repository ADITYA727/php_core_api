<?php 
class rzvy_calendar extends rzvy_slots{
	public $conn;
		
	/* Function to fetch inline calendar */
	public function rzvy_generate_calendar($year, $month, $day_name_length = 3, $first_day = 0, $pn = array(), $time_interval, $rzvy_time_format, $advance_bookingtime, $currDateTime_withTZ, $rzvy_hide_already_booked_slots_from_frontend_calendar, $minimum_date, $maximum_date, $today_date, $service_id = 0, $rzvy_langNewArr, $rzvy_langDefaultArr, $staff_id){
		$first_of_month = gmmktime(0, 0, 0, $month, 1, $year);
		
		/* generate all the day names according to the current locale */
		$day_names = array(); 
		for ($n = 0, $t = (3 + $first_day) * 86400; $n < 7; $n++, $t+=86400){
			/* %A means full textual day name */
			$day_names[$n] = ucfirst(gmstrftime('%A', $t)); 
		}

		list($month, $year, $month_name, $weekday) = explode(',', gmstrftime('%m, %Y, %B, %w', $first_of_month));
		$year = trim($year);
		/* adjust for $first_day */
		$weekday = ($weekday + 7 - $first_day) % 7; 
		
		/* note that some locales don't capitalize month and day names */
		$month_name_title = strtolower(trim($month_name));
		if(isset($rzvy_langNewArr[$month_name_title])){
			$title = htmlentities($rzvy_langNewArr[$month_name_title]).", ". $year;
		}else{
			$title = htmlentities($rzvy_langDefaultArr[$month_name_title]).", ". $year;
		}

		/* Calendar Start */
		
		/* previous and next links, if applicable */
		@list($p, $pl) = each($pn); @list($n, $nl) = each($pn); 
		?>
		<!-- begin the new month table -->
		<div class='rzvy-inline-calendar-container-main'>
			<div class='rzvy-inline-calendar-container-main-row rzvy_pagi_cal_div'>
				<?php 
				if($p){ 
					?>
					<span class="rzvy_prev_icon pl-4"><?php echo ($pl ? '<a href="javascript:void(0)" class="btn btn-link text-dark rzvy_cal_prev_month" data-month="'.$pl.'">' . $p . '</a>' : '<a href="javascript:void(0)" class="btn btn-link text-dark">'.$p.'</a>'); ?></span>
					<?php 
				} 
				?>
				<span class="rzvy_center_title"><b><?php echo $title; ?></b></span>
				<?php 
				if($n){ 
					?>
					<span class="rzvy_next_icon pr-4"><?php echo ($nl ? '<a href="javascript:void(0)" class="btn btn-link text-dark rzvy_cal_next_month" data-month="'.$nl.'">' . $n . '</a>' : '<a href="javascript:void(0)" class="btn btn-link text-dark">'.$n.'</a>'); ?></span>
					<?php 
				}
				?>
			</div>
			<!-- column headings -->
			<div class='rzvy-inline-calendar-container-main-row'>
				<?php 
				foreach($day_names as $d){ 
					?>
					<div class='rzvy-inline-calendar-container-main-rowcol'><?php $day_name_title = strtolower(trim(substr($d,0,$day_name_length))); if(isset($rzvy_langNewArr[$day_name_title])){ echo $rzvy_langNewArr[$day_name_title]; }else{ echo $rzvy_langDefaultArr[$day_name_title]; } ?></div>
					<?php 
				} 
				?>
			</div>
			<div class='rzvy-inline-calendar-container-main-row'>
		<?php 
		if($weekday > 0) 
		{
			for ($i = 0; $i < $weekday; $i++) 
			{
				/* initial 'empty' days */
				?>
				<div class='rzvy-inline-calendar-container-main-rowcel'></div>
				<?php 
			}
		}
		for($day = 1, $days_in_month = gmdate('t',$first_of_month); $day <= $days_in_month; $day++, $weekday++)
		{
			$total_days_in_month_check = gmdate('t',$first_of_month);
			if($weekday == 7)
			{
				$weekday   = 0; 
				/* start a new week  */
				
				if($day > 1 && $day <= $total_days_in_month_check){
					?>
					</div>
					<div class='rzvy-inline-calendar-container-main-row'>
					<?php
				}else{
					?>
					<div class='rzvy-inline-calendar-container-main-row'>
					<?php 
				}
			}
			if(strtotime($year."-".$month."-".$day) < strtotime($today_date)){ 
				?>
				<div data-day="" class='rzvy-inline-calendar-container-main-rowcel previous_date'><p><?php echo $day; ?></p></div>
				<?php 
			}else{ 				
				/** 
				 * START
				 * Show full green as full day available, 
				 * Show first half green and second half blue as first half available, 
				 * Show first half blue and second half green as second half available, 
				 * Show full blue as full day not available, 
				**/
					$avail_date = date("Y-m-d", strtotime($year."-".$month."-".$day));
					$isEndTime = false;
					$this->staff_id = $staff_id;
					$available_slots = $this->generate_available_slots_dropdown($time_interval, $rzvy_time_format, $avail_date, $advance_bookingtime, $currDateTime_withTZ, $isEndTime, $service_id); 
					/** maximum date check **/		
					if(strtotime($avail_date)>strtotime($maximum_date)){ 
						?>
						<div data-day="" class='rzvy-inline-calendar-container-main-rowcel previous_date'><p><?php echo $day; ?></p></div>
						<?php 
					}
					/** time slots **/
					else if(isset($available_slots['slots']) && sizeof($available_slots['slots'])>0){
						$i = 1;
						$j = 0;
						$total_slots_devided = (count($available_slots['slots'])/2);
						$first_half_count = 0;
						$second_half_count = 0;
						foreach($available_slots['slots'] as $slot){
							$booked_slot_exist = false;
							foreach($available_slots['booked'] as $bslot){
								if($bslot["start_time"] <= strtotime($avail_date." ".$slot) && $bslot["end_time"] > strtotime($avail_date." ".$slot)){
									$booked_slot_exist = true;
									continue;
								} 
							}
							if(strtotime($avail_date." ".$slot)<strtotime($minimum_date)){
								$i++;
								continue;
							}else if($booked_slot_exist && $rzvy_hide_already_booked_slots_from_frontend_calendar == "Y"){
								$i++;
								continue;
							}else if($booked_slot_exist && $rzvy_hide_already_booked_slots_from_frontend_calendar == "N"){ 
								$i++;
								$j++;
								continue;
							}else{ 
								$blockoff_exist = false;
								if(sizeof($available_slots['block_off'])>0){
									foreach($available_slots['block_off'] as $block_off){
										if((strtotime($avail_date." ".$block_off["start_time"]) <= strtotime($avail_date." ".$slot)) && (strtotime($avail_date." ".$block_off["end_time"]) > strtotime($avail_date." ".$slot))){
											$blockoff_exist = true;
											$i++;
											continue;
										} 
									}
								} 
								if($blockoff_exist){
									$i++;
									continue;
								} 
								if($i<=$total_slots_devided){
									$first_half_count = $first_half_count+1;
								}else{
									$second_half_count = $second_half_count+1;
								}
								$j++;
							}
							$i++;
						}
						if($j == 0){ 
							?>
							<div data-day="" class='rzvy-inline-calendar-container-main-rowcel full_day_off'><p><?php echo $day; ?></p></div>
							<?php 
						}else{
							if($first_half_count>0 && $second_half_count>0){ 
								?>
								<div data-day="<?php echo $avail_date; ?>" class='rzvy-inline-calendar-container-main-rowcel full_day_available rzvy_date_selection'><p><?php echo $day; ?></p></div>
								<?php 
							} else if($first_half_count>0 && $second_half_count==0){ 
								?>
								<div data-day="<?php echo $avail_date; ?>" class='rzvy-inline-calendar-container-main-rowcel first_half_available_date rzvy_date_selection'><p><?php echo $day; ?></p></div>
								<?php 
							} else if($first_half_count==0 && $second_half_count>0){ 
								?>
								<div data-day="<?php echo $avail_date; ?>" class='rzvy-inline-calendar-container-main-rowcel second_half_available_date rzvy_date_selection'><p><?php echo $day; ?></p></div>
								<?php 
							}else{ 
								?>
								<div data-day="" class='rzvy-inline-calendar-container-main-rowcel full_day_off'><p><?php echo $day; ?></p></div>
								<?php 
							}
						}
					}else{ 
						?>
						<div data-day="" class='rzvy-inline-calendar-container-main-rowcel full_day_off'><p><?php echo $day; ?></p></div>
						<?php 
					} 
				/** 
				 * END
				 * Show full green as full day available, 
				 * Show first half green and second half blue as first half available, 
				 * Show first half blue and second half green as second half available, 
				 * Show full blue as full day not available, 
				**/ 
			} 
		}
		if($weekday != 7){
			/* remaining "empty" days */
			for($j = 1; $j <= (7-$weekday); $j++){
				?>
				<div class='rzvy-inline-calendar-container-main-rowcel'></div>
				<?php 
			}
		}

		?>
		</div>
		<div class="row pl-5 pt-1">
			<span class="col-md-6 rzvy_full_day_available_label"><span></span> <?php if(isset($rzvy_langNewArr["full_day_available"])){ echo $rzvy_langNewArr["full_day_available"]; }else{ echo $rzvy_langDefaultArr["full_day_available"]; } ?> </span>
			<span class="col-md-6 rzvy_fhalf_available_label"><span></span> <?php if(isset($rzvy_langNewArr["first_half_available"])){ echo $rzvy_langNewArr["first_half_available"]; }else{ echo $rzvy_langDefaultArr["first_half_available"]; } ?> </span>
			<span class="col-md-6 rzvy_shalf_available_label"><span></span> <?php if(isset($rzvy_langNewArr["second_half_available"])){ echo $rzvy_langNewArr["second_half_available"]; }else{ echo $rzvy_langDefaultArr["second_half_available"]; } ?> </span>
			<span class="col-md-6 rzvy_full_day_off_label"><span></span> <?php if(isset($rzvy_langNewArr["full_day_not_available"])){ echo $rzvy_langNewArr["full_day_not_available"]; }else{ echo $rzvy_langDefaultArr["full_day_not_available"]; } ?> </span>
		</div>
		</div>
		<?php
	}
} 
?>