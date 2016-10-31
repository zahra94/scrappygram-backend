<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Vendors extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('vendors');
		$crud->columns('vendor_id', 'vendor_email', 'vendor_zipcode', 'vendor_saturday', 'vendor_sunday', 'vendor_cls_time', 'vendor_timezone', 'vendor_rating', 'vendor_order_count', 'vendor_order_limit');
		$crud->display_as('vendor_id', 'ID')
			 ->display_as('vendor_email', 'Email Address')
			 ->display_as('vendor_zipcode', 'ZipCode')
			 ->display_as('vendor_saturday', 'Saturday')
			 ->display_as('vendor_sunday', 'Sunday')
			 ->display_as('vendor_cls_time', 'Vendor Closing Time')
			 ->display_as('vendor_timezone', 'TimeZone')
			 ->display_as('vendor_rating', 'Rating')
			 ->display_as('vendor_order_count', 'Order Count')
			 ->display_as('vendor_order_limit', 'Order Limit');

		$this->mPageTitle = 'Vendors';
		$this->render_crud();
	}

	// Create Frontend User
	public function create()
	{
		

		$form = $this->form_builder->create_form();

		$this->form_validation->set_rules('vendor_email', 'Email Address', 'required|valid_email|is_unique[vendors.vendor_email]');
		$this->form_validation->set_rules('vendor_zipcode', 'ZipCode', 'required|integer|max_length[5]');
		$this->form_validation->set_rules('vendor_order_limit', 'Order Limit', 'required|integer');

		if ($form->validate()) {
			$data = $this->post();

			$this->db->set($data);
			$this->db->insert('vendors');
		}

		$this->mPageTitle = 'Create Vendor';

		$this->mViewData['form'] = $form;
		$this->render('vendor/create');
	}

	
}
