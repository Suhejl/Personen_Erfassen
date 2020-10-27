
<?php
include('include/db_connection.php');
include('functions.php');
include('stored_procedures.php');

// Read
if ($_SERVER['REQUEST_METHOD'] === 'GET') {

    if (isset($_GET['id'])) {
        $id = $_GET['id'];

        $personalData = getPersonalDataByID($id);

        echo $personalData;
    } else {
        $personaldatas = getPersonalDatas();

        echo $personaldatas;
    }
}

// Create
if ($_SERVER['REQUEST_METHOD'] === 'POST' && !isset($_POST['_method'])) {
    echo "sdfg";
    $_firstname = $_POST['firstname'];
    $_lastname = $_POST['lastname'];
    $_birthday = $_POST['birthday'];
    $_email = $_POST['email'];
    $_ahvNr = $_POST['ahvNr'];
    $_personalNr = $_POST['personalNr'];
    $_telefon = $_POST['telefon'];
    $_departement = $_POST['departement'];
    $_jobtitle = $_POST['jobtitle'];

    $datas = array($_firstname, $_lastname, $_birthday, $_email, $_ahvNr, $_personalNr, $_telefon, $_departement, $_jobtitle);
    echo "Firstname: " . $_firstname;

    if (!isset_properties($datas)) {
        header("Location: ../record_person");
        die();
    }

    $sql_update_data = "SELECT Companydata_ID, Companyname, Departement, Jobtitle, Jobdescription from companydata";

    $ppStmt = $dbconn->prepare($sql_update_data);

    $ppStmt->execute();

    while ($data = $ppStmt->fetch(PDO::FETCH_ASSOC)) {
        $companydatas[] = $data;
    }

    foreach ($companydatas as $data) {
        if($data['Departement'] === $_departement && $data['Jobtitle'] === $_jobtitle){
            $companyID = $data['Companydata_ID'];
        }
    }

    echo $_personalNr;
    $status = insertPersonalData($_firstname, $_lastname, $_birthday, $_email, $_ahvNr, $_personalNr, $_telefon, $companyID);

    if ($status === false) {
        trigger_error("ERrrrrrrrrrrrrrrrrror", E_USER_ERROR);
    } else {
        header('Location: ../index');
    }
}

// Update
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['_method']) && $_POST['_method'] === 'PUT') {
    $id = $_POST['id'];
    $_firstname = $_POST['firstname'];
    $_lastname = $_POST['lastname'];
    $_birthday = $_POST['birthday'];
    $_email = $_POST['email'];
    $_ahvNr = $_POST['ahvNr'];
    $_personalNr = $_POST['personalNr'];
    $_telefon = $_POST['telefon'];

    $datas = array($_firstname, $_lastname, $_birthday, $_email, $_ahvNr, $_personalNr, $_telefon);
    echo "Firstname: " . $_firstname;
    if (!isset_properties($datas)) {
        header("Location: ../edit?id=$id");
        die();
    }

    echo $_personalNr;
    
    $status = updatePersonalData($id, $_firstname, $_lastname, $_birthday, $_email, $_ahvNr, $_personalNr, $_telefon);

    if ($status === false) {
        trigger_error("ERrrrrrrrrrrrrrrrrror", E_USER_ERROR);
    } else {
        header('Location: ../index');
    }
}

if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['method']) && $_GET['method'] === 'delete') {
    $_id = $_GET['id'];

    if ($_id === null) {
        header('HTTP/1.0 404 Not Found');
        die();
    }

    $status = deletePersonalData($_id);

    if ($status === false) {
        trigger_error("ERrrrrrrrrrrrrrrrrror", E_USER_ERROR);
    } else {
        header('Location: ../index');
    }
    header('Location: ../index');
}

?>