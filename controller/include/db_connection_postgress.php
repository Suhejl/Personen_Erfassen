<?php

$host = "odbc:PostgreSQL35W";
$user = "postgres";
$password = "123456";
try {
    $con = new PDO($host, $user, $password);
    return $con;
} catch (PDOException $e) {
    echo "Error!: " . $e->getMessage() . "<br/>";
    return null;
}
?>
