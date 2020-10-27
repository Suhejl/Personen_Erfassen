<?php
//test
function isset_properties($datas)
{
    for ($i = 0; $i < count($datas); $i++) {
        echo "<br>";
        echo $datas[$i];
        if (trim($datas[$i]) === null || empty(trim($datas[$i]))) {
            return false;
        }
    }
    return true;
}

?>