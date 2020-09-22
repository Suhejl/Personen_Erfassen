<?php  
   $user = "root";
   $pw = "";
  
//connect to database
 $dsn ="odbc:MySQLBeispielLogin";

//"mysql:host=192.168.99.100:32769;dbname=Personaldata", "root", "123456"

try{
//$dbconn = new PDO("mysql:host=localhost:3306;dbname=persondata", "root", "");

$dbconn = new PDO("odbc:PostgreSQL35W", "postgres", "123456");

return $dbconn;
}catch(PDOException $e){
   print "Error!: " . $e->getMessage() . "<br/>";
   die();
}
?>