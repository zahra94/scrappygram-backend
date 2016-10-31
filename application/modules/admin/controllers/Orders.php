<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Orders extends Admin_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->library('form_builder');
	}

	// Frontend User CRUD
	public function index()
	{
		$crud = $this->generate_crud('orders');
		$crud->columns('order_id', 'filenames', 'amount', 'brain_confirm_id');
		$crud->display_as('order_id', 'Order Number')
			 ->display_as('brain_confirm_id', 'Braintree Confirmation Id');


		$this->mPageTitle = 'Orders';
		$this->render_crud();
	}

}
