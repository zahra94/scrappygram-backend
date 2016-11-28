<?php

if (strpos($_SERVER['SERVER_NAME'], "herokuapp.com") !== false) {
	
	$DBconfig = array(
	    "database_type"=>"pgsql",
	    "database_name"=>"d5bvn9hj6ekmcb",
	    "server"=>"ec2-52-86-23-161.compute-1.amazonaws.com",
	    "username"=>"u4b4ck2pr818qd",
	    "password"=>"p9e2eik71mcicm6vvedvmb0is79",
	    "charset"=>"utf8",
	    "port"=>5432
	);
} else {
	
	$DBconfig = array(
	     "database_type"=>"pgsql",
	    "database_name"=>"d5bvn9hj6ekmcb",
	    "server"=>"ec2-52-86-23-161.compute-1.amazonaws.com",
	    "username"=>"u4b4ck2pr818qd",
	    "password"=>"p9e2eik71mcicm6vvedvmb0is79",
	    "charset"=>"utf8",
	    "port"=>5432
	);

}

 ?>