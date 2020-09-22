
<?php
include('include/db_connection.php');
include('functions.php');

// Read
if ($_SERVER['REQUEST_METHOD'] === 'GET') {

    if (isset($_GET['id'])) {
        $id = $_GET['id'];

        $sql_select_data = "SELECT Personaldata_ID, Firstname, Lastname, Birthday, Email, AHV, Personalnumber, Phonenumber, Companyname, Departement, Jobtitle, Jobdescription 
        FROM personaldata 
        JOIN companydata 
        ON ID_Companydata = Companydata_ID 
        WHERE Personaldata_ID = $id";

        $ppStmt = $dbconn->prepare($sql_select_data);
        $ppStmt->execute();
        $data = $ppStmt->fetch(PDO::FETCH_ASSOC);

        header('Content-Type: application/json');
        echo json_encode($data);
    } else {
        $sql_select_data = "SELECT Personaldata_ID, Firstname, Lastname, Birthday, Email, AHV, Personalnumber, Phonenumber, Companyname, Departement, Jobtitle, Jobdescription 
        FROM personaldata 
        JOIN companydata 
        ON ID_Companydata = Companydata_ID";

        $ppStmt = $dbconn->prepare($sql_select_data);
        $ppStmt->execute();
        while ($data = $ppStmt->fetch(PDO::FETCH_ASSOC)) {
            $personaldatas[] = $data;
        }

        header('Content-Type: application/json');
        echo json_encode($personaldatas);
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

    $datas = array($_firstname, $_lastname, $_birthday, $_email . $_ahvNr, $_personalNr, $_telefon);
    echo "Firstname: " . $_firstname;

    if (!isset_properties($datas)) {
        header("Location: ../record_person");
        die();
    }

    echo $_personalNr;
    $sql_update_data = "INSERT INTO personaldata 
    (Firstname, Lastname, Birthday, Email, AHV, Personalnumber, Phonenumber)
    VALUES (?, ?, ?, ?, ?, ?, ?)";

    $ppStmt = $dbconn->prepare($sql_update_data);

    $ppStmt->bindParam('1', $_firstname, PDO::PARAM_STR);
    $ppStmt->bindParam('2', $_lastname, PDO::PARAM_STR);
    $ppStmt->bindParam('3', $_birthday, PDO::PARAM_STR);
    $ppStmt->bindParam('4', $_email, PDO::PARAM_STR);
    $ppStmt->bindParam('5', $_ahvNr, PDO::PARAM_STR);
    $ppStmt->bindParam('6', $_personalNr, PDO::PARAM_INT);
    $ppStmt->bindParam('7', $_telefon, PDO::PARAM_STR);

    $status = $ppStmt->execute();

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

    $datas = array($_firstname, $_lastname, $_birthday, $_email . $_ahvNr, $_personalNr, $_telefon);
    echo "Firstname: " . $_firstname;
    if (!isset_properties($datas)) {
        header("Location: ../edit?id=$id");
        die();
    }

    echo $_personalNr;
    $sql_update_data = "UPDATE personaldata 
     SET Firstname = ?,
      Lastname = ?,
      Birthday = ?,
      Email = ?,
      AHV = ?,
      Personalnumber = ?, 
      Phonenumber = ? 
      WHERE Personaldata_ID = ?";

    $ppStmt = $dbconn->prepare($sql_update_data);

    $ppStmt->bindParam('1', $_firstname, PDO::PARAM_STR);
    $ppStmt->bindParam('2', $_lastname, PDO::PARAM_STR);
    $ppStmt->bindParam('3', $_birthday, PDO::PARAM_STR);
    $ppStmt->bindParam('4', $_email, PDO::PARAM_STR);
    $ppStmt->bindParam('5', $_ahvNr, PDO::PARAM_STR);
    $ppStmt->bindParam('6', $_personalNr, PDO::PARAM_INT);
    $ppStmt->bindParam('7', $_telefon, PDO::PARAM_STR);
    $ppStmt->bindParam('8', $id, PDO::PARAM_INT);

    $status = $ppStmt->execute();

    if ($status === false) {
        trigger_error("ERrrrrrrrrrrrrrrrrror", E_USER_ERROR);
    } else {
        header('Location: ../index');
    }
}

?>