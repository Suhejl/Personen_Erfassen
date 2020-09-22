<?php

include('include/db_connection.php');

$stored_procedure_name = "Stored_Procedure_SELECT_INSERT_UPDATE_DELETE";

function getPersonalDatas(){
    global $stored_procedure_name;
    global $dbconn;
    $personalDatasQuery = "CALL $stored_procedure_name ('','','','','','','','','', 'SELECT')";

    $ppStmt = $dbconn->prepare($personalDatasQuery);

    $ppStmt->execute();
    global $personaldatas;
    while ($data = $ppStmt->fetch(PDO::FETCH_ASSOC)) {
        $personaldatas[] = $data;
    
    } 

    header('Content-Type: application/json');
    echo json_encode($personaldatas);
}

function getPersonalDataByID($id){
    global $stored_procedure_name;
    global $dbconn;

    $personalDataQuery = "CALL $stored_procedure_name ($id,'','','','','','','','', 'SELECTBYID')";
    $ppStmt = $dbconn->prepare($personalDataQuery);

    $ppStmt->execute();
    $data = $ppStmt->fetch(PDO::FETCH_ASSOC);

    header('Content-Type: application/json');
    echo json_encode($data);
}

function insertPersonalData($_firstname, $_lastname, $_birthday, $_email, $_ahvNr, $_personalNr, $_telefon, $companyID){
    global $stored_procedure_name;
    global $dbconn;

    // For testing purposes
    // echo "-----------------------------------------";
    // echo "\n\r";
    // echo $_firstname. "        ";
    // echo $_lastname. "        ";
    // echo $_birthday. "        ";
    // echo $_email. "        ";
    // echo $_ahvNr. "        ";
    // echo $_personalNr. "        ";
    // echo $_telefon. "        ";
    // echo "-----------------------------------------";
    // echo "\n\r";
    //('','TEST', 'testt', '2003-04-22', 'test@gmail.com', '123.124.3124.13', '123431', '0341913801381', '1','INSERT')";

    $insertPersonalDataQuery = "CALL $stored_procedure_name ('',?, ?, ?, ?, ?, ?, ?, ?,'INSERT')";


    $ppStmt = $dbconn->prepare($insertPersonalDataQuery);

    $ppStmt->bindParam('1', $_firstname, PDO::PARAM_STR);
    $ppStmt->bindParam('2', $_lastname, PDO::PARAM_STR);
    $ppStmt->bindParam('3', $_birthday, PDO::PARAM_STR);
    $ppStmt->bindParam('4', $_email, PDO::PARAM_STR);
    $ppStmt->bindParam('5', $_ahvNr, PDO::PARAM_STR);
    $ppStmt->bindParam('6', $_personalNr, PDO::PARAM_INT);
    $ppStmt->bindParam('7', $_telefon, PDO::PARAM_STR);
    $ppStmt->bindParam('8', $companyID, PDO::PARAM_INT);

    $status = $ppStmt->execute();

    return $status;
}

function updatePersonalData($id, $_firstname, $_lastname, $_birthday, $_email, $_ahvNr, $_personalNr, $_telefon){
    global $stored_procedure_name;
    global $dbconn;

    $updatePersonalDataQuery = "CALL $stored_procedure_name (?, ?, ?, ?, ?, ?, ?, ?, '1','UPDATE')";

    $ppStmt = $dbconn->prepare($updatePersonalDataQuery);

    $ppStmt->bindParam('1', $id, PDO::PARAM_INT);
    $ppStmt->bindParam('2', $_firstname, PDO::PARAM_STR);
    $ppStmt->bindParam('3', $_lastname, PDO::PARAM_STR);
    $ppStmt->bindParam('4', $_birthday, PDO::PARAM_STR);
    $ppStmt->bindParam('5', $_email, PDO::PARAM_STR);
    $ppStmt->bindParam('6', $_ahvNr, PDO::PARAM_STR);
    $ppStmt->bindParam('7', $_personalNr, PDO::PARAM_INT);
    $ppStmt->bindParam('8', $_telefon, PDO::PARAM_STR);

    $status = $ppStmt->execute();

    return $status;
}

function deletePersonalData($id){
    global $stored_procedure_name;
    global $dbconn;

    $personalDataQuery = "CALL $stored_procedure_name ($id,'','','','','','','','', 'DELETE')";
    $ppStmt = $dbconn->prepare($personalDataQuery);

    $status = $ppStmt->execute();

    return $status;
}