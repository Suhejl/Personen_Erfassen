<?php  
   $user = "root";
   $pw = "";
  
//connect to database
 $dsn ="odbc:MySQLBeispielLogin";

echo "<font color='red'>DIL Data Interface Layer [ODBC] to MYSQL</font><br>";
//"mysql:host=192.168.99.100:32769;dbname=Personaldata", "root", "123456"
$dbconn = new PDO("mysql:host=localhost:3306;dbname=persondata", "root", "");

//$dbconn = new PDO("odbc:MYSQL_PERSONALDATA", "root", "123456");

// try{
//    foreach($dbconn->query("select * from personaldata") as $row){
//    print_r($row);
// }
// }catch(PDOException $e){
//    print "Error!: " . $e->getMessage() . "<br/>";
//    die();
// }
?>