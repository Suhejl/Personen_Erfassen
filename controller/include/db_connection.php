<?php  
   $user = "root";
   $pw = "";
  
//connect to database
 $dsn ="odbc:MySQLBeispielLogin";

echo "<font color='red'>DIL Data Interface Layer [ODBC] to MYSQL</font><br>";

$dbconn = new PDO("mysql:host=192.168.99.100:32769;dbname=Personaldata", "root", "123456");
//$dbconn = new PDO("odbc:MYSQL_PERSONALDATA", "root", "123456");

?>