<?php


require 'vendor/autoload.php';



##################################
###        API                 ###
##################################
error_reporting(E_ERROR | E_PARSE);

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;
$app = new \Slim\App;


$app->post('/registerCustomer', function (Request $request, Response $response) use ($app){
    print_r('ljl');
    die();
    
   
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