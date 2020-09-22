window.onload = loadDataToEdit();

function loadDataToEdit(){
    const queryString = window.location.search;
    console.log(queryString);
    
    const urlParams = new URLSearchParams(queryString);

    const id = urlParams.get('id');

    var request = new XMLHttpRequest();
    request.open('GET', `controller/personaldata.php?id=${id}`, true);
    console.log(request);

    request.onload = function(){
        console.log("Response: " + this.response);
        var json = JSON.parse(this.response);
        console.log('reached');
        console.log(json);

        let idInput = document.getElementById('id');
        let firstnameInput = document.getElementById('firstname');
        let lastnameInput = document.getElementById('lastname');
        let birthdayInput = document.getElementById('birthday');
        let emailInput = document.getElementById('email');
        let ahvNrInput = document.getElementById('ahvNr');
        let personalNrInput = document.getElementById('personalNr');
        let telefonInput = document.getElementById('telefon');
        
        console.log(json.Firstname);
        idInput.value = json.Personaldata_ID;
        firstnameInput.value = json.Firstname;
        lastnameInput.value = json.Lastname;
        birthdayInput.value = json.Birthday;
        emailInput.value = json.Email;
        ahvNrInput.value = json.AHV;
        personalNrInput.value = json.Personalnumber;
        telefonInput.value = json.Phonenumber;
    }

    console.log(id);
    request.send(null);
}

function editData(){
    var request = new XMLHttpRequest();
    request.open('PUT', `controller/personaldata.php?id=${id}`, true);
    console.log(request);
}