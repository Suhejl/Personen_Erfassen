
<?php
include('include/db_connection.php');

// Create
if ($_SERVER['REQUEST_METHOD'] === 'POST'){

    $_firstname = $_POST['firstname'];
    $_lastname = $_POST['lastname'];

    if(isset($_POST)) {
        echo $_firstname . $_lastname;
    }
}

?>