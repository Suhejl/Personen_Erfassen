
<?php
include('include/db_connection.php');

// Read
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    $sql_select_data = "SELECT Firstname, Lastname, Birthday, Email, AHV, Personalnumber, Companyname, Department, Jobtitle, Jobdescription FROM personaldata JOIN companydata ON ID_Companydata = Companydata_ID";

    $ppStmt = $dbconn->prepare($sql);
    $ppStmt->execute();
    $data = $ppStmt->fetch(PDO::FETCH_ASSOC);

    header('Content-Type: application/json');
    echo json_encode($data);
}

// Create
if ($_SERVER['REQUEST_METHOD'] === 'POST'){

    $_firstname = $_POST['firstname'];
    $_lastname = $_POST['lastname'];

    if(isset($_POST)) {
        echo $_firstname . $_lastname;
    }
}

?>