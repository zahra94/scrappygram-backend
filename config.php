<?php

if (strpos($_SERVER['SERVER_NAME'], "herokuapp.com") !== false) {
	
	$DBconfig = array(
	    "database_type"=>"pgsql",
	    "database_name"=>"d155nktfa27sm4",
	    "server"=>"ec2-107-22-250-212.compute-1.amazonaws.com",
	    "username"=>"vuvsizazbuhdgy",
	    "password"=>"kpbxfYeR_z63n2AHSfsBgAeOFO",
	    "charset"=>"utf8",
	    "port"=>5432
	);
} else {
	
	$DBconfig = array(
	    "database_type"=>"pgsql",
	    "database_name"=>"scrappygram_dev",
	    "server"=>"localhost",
	    "username"=>"postgres",
	    "password"=>"james",
	    "charset"=>"utf8",
	    "port"=>5432
	);

}

 ?>