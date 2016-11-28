<?php

error_reporting(E_ERROR | E_PARSE);

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;

require '../vendor/autoload.php';
require '../vendor/classes/class.medoo.php';


$app = new \Slim\App;

$app->get('/customer/{id}', function (Request $request, Response $response) {
    $headers = $request->getHeaders();
    $a=$app->request()->params('abc');
     $response =json_encode(array('status'=>$a));
     return $response;
	print_r($headers);
	die();
    $id = $request->getAttribute('id');
    $response->getBody()->write("Hello, $id");
    $response->withHeader(
        'Content-Type',
        'application/json'
    );
    return $response;
});
$app->post('/registerCustomer', function (Request $request, Response $response) use ($app){
    require_once '../config.php';

   
    $header= $request->getHeader('X-API-KEY');
    $key='ixZePbqTLpCfiVvkTwLPEHb8kmekJeGJiQRAIAoQ';
    $api_key=$header[0];
    if($api_key!=$key)
    {
    	$response =json_encode(array('status'=>0,'message'=>'Aunthentication fails'));
     	return $response;
    }
    
    if($request->getHeader('Content-Type')[0]!='application/x-www-form-urlencoded')
    {
    	$response =json_encode(array('status'=>0,'message'=>'Invalid content type'));
     	return $response;
    }
    $data=$request-> getParsedBody();
    	if(!preg_match('#+[^0-9]#',$data['phone']))
		{
			
			// Check if same user exist or not.
			$medoo=new medoo($DBconfig);
			$row=$medoo->select("customers", "*", [
			"phone" => $data["phone"]
			]);

			
			if ($row){
				$json = json_encode(
					array(
						"status" => 0,
						"message" => "There is customer has same phone number.",
						)
				);
			} else {
				$last_user_id=$medoo->insert("customers", $data);

				if ($last_user_id){
					$json = json_encode(
						array(
							"status" => 1,
							"message" => "Successfully Registered.",
							)
					);
				}
				else
				{
					$json = json_encode(
						array(
							"status" => 0,
							"message" => "Record could not be added",
							)
					);
				}	
			}
		} else {
			$json = json_encode(
				array(
					"status" => 0,
					"phone_number" => $data['phone'],
					"message" => "Phone Number is not numeric.",
					)
			);
		}

		




    $response=$json;
    
    return $response;
});
// $app->get('/tickets', function (Request $request, Response $response) {
//     $this->logger->addInfo("Ticket list");
//     $mapper = new TicketMapper($this->db);
//     $tickets = $mapper->getTickets();

//     $response->getBody()->write(var_export($tickets, true));
//     return $response;
// });

// $app->get('/ticket/{id}', function (Request $request, Response $response, $args) {
//     $ticket_id = (int)$args['id'];
//     $mapper = new TicketMapper($this->db);
//     $ticket = $mapper->getTicketById($ticket_id);

//     $response->getBody()->write(var_export($ticket, true));
//     return $response;
// });

$app->run();


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
	function registerCustomer_post()
	{
		// error_log(print_r(__FUNCTION__ ,true));
		set_time_limit ( 120);
		$data = $this->post();
		print_r($data);
		die();
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
						"message" => "There is customer has same phone number.",
						)
				);
			} else {
				$this->db->set($data);
				if ($this->db->insert('customers') ){
					$json = json_encode(
						array(
							"status" => TRUE,
							"phone_number" => $data['phone'],
							"message" => "Successfully Registered.",
							)
					);
				}	
			}
		} else {
			$json = json_encode(
				array(
					"status" => FALSE,
					"phone_number" => $data['phone'],
					"message" => "Phone Number is not numeric.",
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
		 
	 
	 * @return $json(status, id, message)
	 	Response Type: application/json

	 * @Sample Request

	----------------- End Point -----------------
	 	http://example.com/api/scrappygram/isCustomer?phone=***&X-API-KEY=***

	----------------- Request Type -----------------
		GET	

	 */
	function checkCustomer_get()
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
						"message" => "This Customer is exist !",
						)
				);
			}
		} else {
			$json = json_encode(
				array(
					"status" => FALSE,
					"id" => "",
					"message" => "This Customer is not exist !",
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
		 
	 
	 * @return $json(status, id, message)
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
	function isCustomers_post()
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
						"message" => "This Customer is exist !",
						)
				);
			}
		} else {
			$json = json_encode(
				array(
					"status" => FALSE,
					"id" => "",
					"message" => "This Customer is not exist !",
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
	 function getOrder_get()
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
						"message" => "This Order is exist !",
						)
				);
			}
		} else {
			$json = json_encode(
				array(
					"status" => FALSE,
					"id" => "",
					"message" => "This Order is not exist !",
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

function make_data_safe($mixed)
    {
        $data = '';
        if (is_array($mixed)) {
            foreach ($mixed as $key => $val) {
                $data[$key] = make_data_safe($val);
            }
        } else {
            if(get_magic_quotes_gpc()) {
                $mixed = stripslashes($mixed);
            }
            $data = mysql_real_escape_string($mixed);
        }
        return $data;
    }