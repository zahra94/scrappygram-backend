$(document).ready(function() {

	$(".modal").on("shown.bs.modal", function (){
		// Init
		$('form select.bfh-countries, span.bfh-countries, div.bfh-countries').each(function () {
	      var $countries;

	      $countries = $(this);

	      if ($countries.hasClass('bfh-selectbox')) {
	        $countries.bfhselectbox($countries.data());
	      }
	      $countries.bfhcountries($countries.data());
	    });

	    $('form select.bfh-states, span.bfh-states, div.bfh-states').each(function () {
	      var $states;

	      $states = $(this);

	      if ($states.hasClass('bfh-selectbox')) {
	        $states.bfhselectbox($states.data());
	      }
	      $states.bfhstates($states.data());
	    });

	    $('form select.bfh-timezones, div.bfh-timezones').each(function () {
	      var $timezones;

	      $timezones = $(this);

	      if ($timezones.hasClass('bfh-selectbox')) {
	        $timezones.bfhselectbox($timezones.data());
	      }
	      $timezones.bfhtimezones($timezones.data());
	    });

	    $('div.bfh-timepicker').each(function () {
	      var $timepicker;

	      $timepicker = $(this);

	      $timepicker.bfhtimepicker($timepicker.data());
	    });

	    $('form input[type="text"].bfh-phone, form input[type="tel"].bfh-phone, span.bfh-phone').each(function () {
	      var $phone;

	      $phone = $(this);

	      $phone.bfhphone($phone.data());
	    });

	    // Vendor Page
	    $('.bfh-timepicker.vendor-timezones').on('change.bfhtimepicker', function() {
			var time = $(this).val();
			$('input[name=vendor_cls_time]').val(time);
		});

		$('.bfh-selectbox.vendor-country').on('change.bfhselectbox', function() {
			var country_id = $(this).val();
			$('input[name=vendor_country]').val(country_id);
		});

		$('.bfh-selectbox.vendor-states').on('change.bfhselectbox', function() {
			var state_id = $(this).val();
			$('input[name=vendor_state]').val(state_id);
		});

		$('.bfh-selectbox.vendor-timezones').on('change.bfhselectbox', function() {
			var timezone = $(this).val();
			$('input[name=vendor_timezone]').val(timezone);
		});

		// Customer Page
		$('.bfh-selectbox.country').on('change.bfhselectbox', function() {
			var country_id = $(this).val();
			$('input[name=country]').val(country_id);
		});

		$('.bfh-selectbox.states').on('change.bfhselectbox', function() {
			var state_id = $(this).val();
			$('input[name=state]').val(state_id);
		});

		// Init
		$('.bfh-timepicker').trigger('change');
	});

	// Vendor Page
	$('.bfh-timepicker.vendor-timezones').on('change.bfhtimepicker', function() {
		var time = $(this).val();
		$('input[name=vendor_cls_time]').val(time);
	});

	$('.bfh-selectbox.vendor-country').on('change.bfhselectbox', function() {
		var country_id = $(this).val();
		$('input[name=vendor_country]').val(country_id);
	});

	$('.bfh-selectbox.vendor-states').on('change.bfhselectbox', function() {
		var state_id = $(this).val();
		$('input[name=vendor_state]').val(state_id);
	});

	$('.bfh-selectbox.vendor-timezones').on('change.bfhselectbox', function() {
		var timezone = $(this).val();
		$('input[name=vendor_timezone]').val(timezone);
	});

	// Customer Page

	$('.bfh-selectbox.country').on('change.bfhselectbox', function() {
		var country_id = $(this).val();
		$('input[name=country]').val(country_id);
	});

	$('.bfh-selectbox.states').on('change.bfhselectbox', function() {
		var state_id = $(this).val();
		$('input[name=state]').val(state_id);
	});

	$('.bfh-countries').trigger('change');
	
});