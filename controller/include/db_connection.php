<?php  

        $host="odbc:MYSQL_PERSONALDATA";
        $user="root";
        $password="";
        try{
            $dbconn=new PDO($host, $user, $password);
            //$dbconn = new PDO("mysql:host=localhost:3306;dbname=persondata", "root", "");
        }catch (PDOException $e) {
            echo "Error!: " . $e->getMessage() . "<br/>";
         }

   /*$user = "root";
   $pw = "";
  
//connect to database
 $dsn ="odbc:MySQLBeispielLogin";

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
// }*/
?>