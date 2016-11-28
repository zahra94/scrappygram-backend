<?php

use \Psr\Http\Message\ServerRequestInterface as Request;
use \Psr\Http\Message\ResponseInterface as Response;


require '../vendor/autoload.php';
 
// Or if you just download the medoo.php into directory, and require it with the correct path.
require_once '../vendor/classes/class.medoo.php';
 

$app = new \Slim\App;
$app->get('/customers/[{name}]', function (Request $request, Response $response) {
	$database = new medoo([
	    "database_type"=>"pgsql",
	    "database_name"=>"scrappygram_dev",
	    "server"=>"localhost",
	    "username"=>"postgres",
	    "password"=>"james",
	    "charset"=>"utf8",
	    "port"=>5432
	]);

	$data = $request->getParsedBody();

	$phone = strtolower($data['phone']);
    $email = strtolower($data['email']);
	$count = $database->count("customers",["phone" => $phone]);

	if ($count == "1") { 
        return '111';
    }

	$password = sha1($data['password']);
	$lastid = $database->insert("customers", [
		"phone" => $data['phone'],
        "first_name" => $data['first_name'],
        "last_name" => $data['last_name'],
		"email" => $email,
		"address" => $data['address'],
		"city" => $data['city'],
        "state" => $data['state'],
        "country" => $data['country'],
        "zipcode" => $data['zipcode'],
		"password" => $password,
		]);

	if(isset($data['notification'])) { if($data['notification'] == true) Notification::newUser($lastid,$data['password']); }
	logSystem("New Customer Added - ID: " . $lastid);
    
    $response->getBody()->write("Hello, $name");

    return $this->response->withJson($count);
});

$app->run();