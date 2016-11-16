<?php

class Order extends App {

    public static function add($data) {
    	global $database;
    	$phone = strtolower($data['phone']);
        $email = strtolower($data['email']);
    	$count = $database->count("orders",["phone" => $phone]);

    	if ($count == "1") { 
            return '111';
        }

    	$password = sha1($data['password']);
    	$lastid = $database->insert("orders", [
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
			return "10";
    }

    public static function edit($data) {
    	global $database;
    	$email = strtolower($data['email']);
		$password = sha1($data['password']);
        
		$database->update("orders", [
            "phone" => $data['phone'],
            "first_name" => $data['first_name'],
            "last_name" => $data['last_name'],
            "email" => $email,
            "address" => $data['address'],
            "city" => $data['city'],
            "state" => $data['state'],
            "country" => $data['country'],
            "zipcode" => $data['zipcode'],
            ],
            ["id" => $data['id']
        ]);
		logSystem("Customer Account Edited - ID: " . $data['id']);
		return "20";

    }

    public static function delete($id) {
    	global $database;
        $database->delete("orders", [ "id" => $id ]);
    	logSystem("Customer Account Deleted - ID: " . $id);
    	return "30";
    }

}


?>
