<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Customers extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('customers');
		$crud->columns('id', 'phone', 'first_name', 'last_name', 'email', 'address', 'city', 'state', 'country', 'zipcode', 'orders');
		$crud->display_as('phone', 'Phone Number')
			 ->display_as('email', 'Email Address');

		$this->mPageTitle = 'Customers';
		$this->render_crud();
	}
}
