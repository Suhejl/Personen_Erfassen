<?php

include('include/db_connection.php');
include('functions.php');

// Create
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    echo "sdfg";
    $_company_name = $_POST['company_name'];
    $_departement = $_POST['departement'];
    $_jobtitle = $_POST['jobtitle'];
    $_job_description = $_POST['job_description'];

    $datas = array($_company_name, $_departement, $_job_description);
    echo "Companyname: " . $_company_name;

    if (!isset_properties($datas)) {
        header("Location: ../record_company");
        die();
    }

    echo $_personalNr;
    $sql_update_data = "INSERT INTO companydata 
    (Companyname, Departement, Jobtitle, Jobdescription)
    VALUES (?, ?, ?, ?)";

    $ppStmt = $dbconn->prepare($sql_update_data);

    $ppStmt->bindParam('1', $_company_name, PDO::PARAM_STR);
    $ppStmt->bindParam('2', $_departement, PDO::PARAM_STR);
    $ppStmt->bindParam('3', $_jobtitle, PDO::PARAM_STR);
    $ppStmt->bindParam('4', $_job_description, PDO::PARAM_STR);

    $status = $ppStmt->execute();

    if ($status === false) {
        trigger_error("ERrrrrrrrrrrrrrrrrror", E_USER_ERROR);
    } else {
        header('Location: ../index');
    }
}

if($_SERVER['REQUEST_METHOD'] === 'GET'){
    $sql_update_data = "SELECT Companydata_ID, Companyname, Departement, Jobtitle, Jobdescription from companydata";

    $ppStmt = $dbconn->prepare($sql_update_data);

    $ppStmt->execute();

    while ($data = $ppStmt->fetch(PDO::FETCH_ASSOC)) {
        $personaldatas[] = $data;
    }

    header('Content-Type: application/json');
    echo json_encode($personaldatas);
}



?>