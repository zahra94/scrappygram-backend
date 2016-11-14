<?php

class Vendor extends App {

    public static function add($data) {
    	global $database;
    	$email = strtolower($data['vendor_email']);
    	$count = $database->count("vendors",["vendor_email" => $email]);
        
    	if ($count == "1") { return "112"; }
        
        $i = 1;
        
        $state = ($data['vendor_state']);

        $count_state = $database->count("vendors",["vendor_state" => $data['vendor_state']]);

        if ($count_state > 0){
            $i = $count_state + 1;
        }

        $vendor_id = $state . $i;

    	$lastid = $database->insert("vendors", [
            'vendor_id'         => $vendor_id,
            "vendor_country"    => $data['vendor_country'],
            "vendor_state"   => $data['vendor_state'],
            "vendor_zipcode"    => $data['vendor_zipcode'],
            "vendor_saturday"   => $data['vendor_saturday'],
            "vendor_sunday"     => $data['vendor_sunday'],
    		"vendor_email"      => $email,
    		"vendor_cls_time"   => $data['vendor_cls_time'] ? $data['vendor_cls_time'] : "00:00:00",
    		"vendor_timezone"   => $data['vendor_timezone'],
            "vendor_rating"     => $data['vendor_rating'] ? $data['vendor_rating'] : 0,
            "vendor_order_count"=> $data['vendor_order_count'] ? $data['vendor_order_count'] : 0,
            "vendor_order_limit"=> $data['vendor_order_limit'] ? $data['vendor_order_limit'] : 0
		]);

			logSystem("New Vendor Added - ID: " . $lastid);
			return "10";
    }

    public static function edit($data) {
    	global $database;
    	$email = strtolower($data['vendor_email']);

        $i = 1;
        
        $state = ($data['vendor_state']);

        $count_state = $database->count("vendors",["vendor_state" => $data['vendor_state']]);

        if ($count_state > 0){
            $i = $count_state + 1;
        }

        $vendor_id = $state . $i;

		$database->update("vendors", [
            "vendor_id"         => $vendor_id,
            "vendor_country"    => $data['vendor_country'],
            "vendor_state"      => $data['vendor_state'],
            "vendor_zipcode"    => $data['vendor_zipcode'],
            "vendor_saturday"   => $data['vendor_saturday'],
            "vendor_sunday"     => $data['vendor_sunday'],
            "vendor_email"      => $email,
            "vendor_cls_time"   => $data['vendor_cls_time'] ? $data['vendor_cls_time'] : "00:00:00",
            "vendor_timezone"   => $data['vendor_timezone'],
            "vendor_rating"     => $data['vendor_rating'] ? $data['vendor_rating'] : 0,
            "vendor_order_count"=> $data['vendor_order_count'] ? $data['vendor_order_count'] : 0,
            "vendor_order_limit"=> $data['vendor_order_limit'] ? $data['vendor_order_limit'] : 0
            ],
            ["id" => $data['id']
        ]);

		logSystem("Vendor Account Edited - ID: " . $data['id']);
		return "20";

    }

    public static function delete($id) {
    	global $database;
        $database->delete("vendors", [ "id" => $id ]);
    	logSystem("Vendor Account Deleted - ID: " . $id);
    	return "30";
    }

}


?>
