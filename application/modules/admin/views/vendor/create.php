<?php echo $form->messages(); ?>

<div class="row">

	<div class="col-md-6">
		<div class="box box-primary">
			<div class="box-header">
				<h3 class="box-title">Vendor Info</h3>
			</div>
			<div class="box-body">
				<?php echo $form->open(); ?>

					<?php echo $form->bs3_text('Email Address', 'vendor_email'); ?>
					<?php echo $form->bs3_text('ZipCode', 'vendor_zipcode'); ?>
					<?php echo $form->bs3_text('Saturday', 'vendor_saturday'); ?>
					<?php echo $form->bs3_text('Sunday', 'vendor_sunday'); ?>
					<?php echo $form->bs3_text('Vendor Closing Time', 'vendor_cls_time'); ?>
					<?php echo $form->bs3_text('TimeZone', 'vendor_timezone'); ?>
					<?php echo $form->bs3_text('Rating', 'vendor_rating'); ?>
					<?php echo $form->bs3_text('Order Limit', 'vendor_order_limit'); ?>

					<?php echo $form->bs3_submit(); ?>
					
				<?php echo $form->close(); ?>
			</div>
		</div>
	</div>
	
</div>