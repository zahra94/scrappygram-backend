<?php
defined('BASEPATH') OR exit('No direct script access allowed');
require_once(APPPATH.'third_party/rest_server/libraries/REST_Controller.php');

class ScrappyGram extends REST_Controller {

	/**
	 * Test Endpoint
	 *
	 * @param  int  $id
	 * @return Response
	 */
	public function user_get()
	{
		error_log(print_r(__FUNCTION__ ,true));

		$json = json_encode(
			array(
				"Test" => $this->get('id'),
				)
		);

		$json = str_replace(':null', ':""', $json);

		header('Content-Type: application/json');
		header("Content-encoding: gzip");

		echo gzencode($json);
	}


	/**
	 * @Function Name: Register Customer
	 *
	 * @param
		 phone: 		Integer (Required)
		 first_name: 	String 
		 last_name: 	String 
		 email: 		String 
		 password: 		String (Required)
		 address: 		String 
		 city: 			String 
		 state: 		String 
		 country: 		String 
	 	 zipcode: 		integer
	 
	 * @return $json
	 	type: application/json

	 * @Sample Request

	----------------- End Point -----------------
	 	http://example.com/api/scrappygram/registercustomer

	----------------- Request Type -----------------
		POST	

	----------------- Raw Headers -----------------
	 X-API-KEY: ixZePbqTLpCfiVvkTwLPEHb8kmekJeGJiQRAIAoQ
	 accept: application/json
	 accept-encoding: gzip, deflate
	 accept-language: en-US,en;q=0.8
	 content-type: application/x-www-form-urlencoded
	 user-agent: Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36

	----------------- Data Form -----------------
	 Field: 		Type 	: 	Sample Data 
	---------------------------------------------
	 phone: 		Integer	: 	123456789
	 first_name: 	String 	: 	John 
	 last_name: 	String 	:	Smith
	 email: 		String 	:   johnsmith@scrappygram.com
	 password: 		String  :	admin123
	 address: 		String  :	Ssaint 12 1A
	 city: 			String  :	LosAn
	 state: 		String 	:	CA
	 country: 		String 	: 	United States
	 zipcode: 		integer : 	09823

	 ---------------------------------------------
	
	 */
	public function registerCustomer_post()
	{
		// error_log(print_r(__FUNCTION__ ,true));
		
		$data = $this->post();

		// Check if phone number is numeric or not.
		if(!preg_match('#[^0-9]#',$data['phone']))
		{
		
			// Check if same user exist or not.
			$query = $this->db->select('*')->from('customers')->where('phone', $this->post('phone'))->get();
			if ($query->result()){
				$json = json_encode(
					array(
						"status" => FALSE,
						"data" => $query->result(),
						"Msg" => "There is customer has same phone number.",
						)
				);
			} else {
				$this->db->set($data);
				if ($this->db->insert('customers') ){
					$json = json_encode(
						array(
							"status" => TRUE,
							"phone_number" => $data['phone'],
							"Msg" => "Successfully Registered.",
							)
					);
				}	
			}
		} else {
			$json = json_encode(
				array(
					"status" => FALSE,
					"phone_number" => $data['phone'],
					"Msg" => "Phone Number is not numeric.",
					)
			);
		}

		$json = str_replace(':null', ':""', $json);

		header('Content-Type: application/json');
		header("Content-encoding: gzip");

		echo gzencode($json);
	}
     

    /**
	 * @Function Name: checkCustomer
	 * @Description: Check if the specific customer exists or not.
	 * @param
		 phone: 		Integer (Required)
		 
	 
	 * @return $json(status, id, Msg)
	 	Response Type: application/json

	 * @Sample Request

	----------------- End Point -----------------
	 	http://example.com/api/scrappygram/isCustomer?phone=***&X-API-KEY=***

	----------------- Request Type -----------------
		GET	

	 */
	public function checkCustomer_get()
	{
		// error_log(print_r(__FUNCTION__ ,true));
		
		$query = $this->db->select('*')->from('customers')->where('phone', $this->get('phone'))->get();

		if ($query->result()) {

			foreach ($query->result() as $row)
			{
				$json = json_encode(
					array(
						"status" => TRUE,
						"id" => $row->id,
						"Msg" => "This Customer is exist !",
						)
				);
			}
		} else {
			$json = json_encode(
				array(
					"status" => FALSE,
					"id" => "",
					"Msg" => "This Customer is not exist !",
					)
			);
		}

		$json = str_replace(':null', ':""', $json);

		header('Content-Type: application/json');
		header("Content-encoding: gzip");

		// $this->error();
		echo gzencode($json);

	}


	/**
	 * @Function Name: checkCustomers
	 * * @Description: Check if the customers exist or not.

	 * @param
		 phone1: 		Integer
		 phone2: 		Integer
		 phone3: 		Integer
		 phone4: 		Integer
		 phone5: 		Integer
		 ....
		 
	 
	 * @return $json(status, id, Msg)
	 	Response Type: application/json

		 phone1: 		false
		 phone2: 		true
		 phone3: 		true
		 phone4: 		true
		 phone5: 		false
		 ....


	 * @Sample Request

	----------------- End Point -----------------
	 	http://example.com/api/scrappygram/isCustomers

	----------------- Request Type -----------------
		POST	

	 */
	public function isCustomers_post()
	{
		// error_log(print_r(__FUNCTION__ ,true));
		
		$query = $this->db->select('*')->from('customers')->where('phone', $this->get('phone'))->get();

		if ($query->result()) {

			foreach ($query->result() as $row)
			{
				$json = json_encode(
					array(
						"status" => TRUE,
						"id" => $row->id,
						"Msg" => "This Customer is exist !",
						)
				);
			}
		} else {
			$json = json_encode(
				array(
					"status" => FALSE,
					"id" => "",
					"Msg" => "This Customer is not exist !",
					)
			);
		}

		$json = str_replace(':null', ':""', $json);

		header('Content-Type: application/json');
		header("Content-encoding: gzip");

		// $this->error();
		echo gzencode($json);

	}



	/**
	 * Get Order
	 *
	 * @param  int  $phone
	 * @return Response
	 */
	public function getOrder_get()
	{
		// error_log(print_r(__FUNCTION__ ,true));
		error_log(print_r($_POST,true));
		error_log(print_r($_GET,true));
		
		$query = $this->db->select('*')->from('customers')->where('phone', $this->get('phone'))->get();

		if ($query->result()) {

			foreach ($query->result() as $row)
			{
				$json = json_encode(
					array(
						"status" => TRUE,
						"id" => $row->id,
						"Msg" => "This Order is exist !",
						)
				);
			}
		} else {
			$json = json_encode(
				array(
					"status" => FALSE,
					"id" => "",
					"Msg" => "This Order is not exist !",
					)
			);
		}

		$json = str_replace(':null', ':""', $json);

		header('Content-Type: application/json');
		header("Content-encoding: gzip");

		// $this->error();
		echo gzencode($json);

	}

    function user_post()
    {       
        $data = array('returned: '. $this->post('id'));
        $this->response($data);
    }
 
    function user_put()
    {       
        $data = array('returned: '. $this->put('id'));
        $this->response($data);
    }
 
    function user_delete()
    {
        $data = array('returned: '. $this->delete('id'));
        $this->response($data);
    }
}
