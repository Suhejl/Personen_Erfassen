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

        loadDepartementsAndJobtitlesAndCompanynames();

        let idInput = document.getElementById('id');
        let firstnameInput = document.getElementById('firstname');
        let lastnameInput = document.getElementById('lastname');
        let birthdayInput = document.getElementById('birthday');
        let emailInput = document.getElementById('email');
        let ahvNrInput = document.getElementById('ahvNr');
        let personalNrInput = document.getElementById('personalNr');
        let telefonInput = document.getElementById('telefon');
        let companynameSelect = document.getElementById('companyname');
        let departementSelect = document.getElementById('departement');
        let jobtitleSelect = document.getElementById('jobtitle');
        
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

function loadDepartementsAndJobtitlesAndCompanynames() {
    var request = new XMLHttpRequest();
    request.open("GET", "controller/companydata.php", true);
    console.log(request);
  
    request.onload = function () {
      console.log("Response: " + this.response);
      var companydatas = JSON.parse(this.response);
      console.log("reached");
      console.log(companydatas);
  
      copmanynameSelect = document.getElementById("companyname");
      departementSelect = document.getElementById("departement");
      jobtitleSelect = document.getElementById("jobtitle");
  
      clearSelectOptions(departementSelect);
      clearSelectOptions(jobtitleSelect);
  
      for (let index = 0; index < companydatas.length; index++) {
        var value = companydatas[index].Companyname;
        var opt = document.createElement("option");
  
        opt.appendChild(document.createTextNode(value));
        opt.value = value;
        copmanynameSelect.appendChild(opt);
      }
  
      for (let index = 0; index < companydatas.length; index++) {
        var value = companydatas[index].Departement;
        var opt = document.createElement("option");
  
        opt.appendChild(document.createTextNode(value));
        opt.value = value;
        departementSelect.appendChild(opt);
      }
  
      for (let index = 0; index < companydatas.length; index++) {
        var value = companydatas[index].Jobtitle;
  
        var opt = document.createElement("option");
        opt.appendChild(document.createTextNode(value));
        opt.value = value;
        jobtitleSelect.appendChild(opt);
      }
    };
    request.send(null);
  }

  function clearSelectOptions(selectElement) {
    if (selectElement != null && selectElement.options.length > 0) {
      var i,
        L = selectElement.options.length - 1;
      for (i = L; i >= 0; i--) {
        selectElement.remove(i);
      }
    }
  }

  function updateForCompanyname(selectElement) {
    var request = new XMLHttpRequest();
    request.open("GET", "controller/companydata.php", true);
    console.log(request);
  
    request.onload = function () {
      console.log("Response: " + this.response);
      var companydatas = JSON.parse(this.response);
      console.log("reached");
      console.log(companydatas);
  
      copmanynameSelect = document.getElementById("companyname");
      departementSelect = document.getElementById("departement");
      jobtitleSelect = document.getElementById("jobtitle");
      clearSelectOptions(jobtitleSelect);
      clearSelectOptions(departementSelect);
  
      var selectedIndex = copmanynameSelect.selectedIndex;
  
      for (let index = 0; index < companydatas.length; index++) {
        if (
          companydatas[index].Companyname ===
          copmanynameSelect[selectedIndex].value
        ) {
          var value1 = companydatas[index].Jobtitle;
          var value2 = companydatas[index].Departement;
  
          var opt1 = document.createElement("option");
          var opt2 = document.createElement("option");
  
          opt1.appendChild(document.createTextNode(value1));
          opt2.appendChild(document.createTextNode(value2));
  
          opt1.value = value1;
          opt2.value = value2;
  
          jobtitleSelect.appendChild(opt1);
          departementSelect.appendChild(opt2);
        }
      }
    };
    request.send(null);
  }
  
  function updateForDepartement(selectElement) {
    var request = new XMLHttpRequest();
    request.open("GET", "controller/companydata.php", true);
    console.log(request);
  
    request.onload = function () {
      console.log("Response: " + this.response);
      var companydatas = JSON.parse(this.response);
      console.log("reached");
      console.log(companydatas);
  
      copmanynameSelect = document.getElementById("companyname");
      departementSelect = document.getElementById("departement");
      jobtitleSelect = document.getElementById("jobtitle");
      clearSelectOptions(jobtitleSelect);
      clearSelectOptions(copmanynameSelect);
  
      var selectedIndex = departementSelect.selectedIndex;
  
      for (let index = 0; index < companydatas.length; index++) {
        if (
          companydatas[index].Departement ===
          departementSelect[selectedIndex].value
        ) {
          var value1 = companydatas[index].Jobtitle;
          var value2 = companydatas[index].Companyname;
  
          var opt1 = document.createElement("option");
          var opt2 = document.createElement("option");
  
          opt1.appendChild(document.createTextNode(value1));
          opt2.appendChild(document.createTextNode(value2));
  
          opt1.value = value1;
          opt2.value = value2;
  
          jobtitleSelect.appendChild(opt1);
          copmanynameSelect.appendChild(opt2);
        }
      }
    };
    request.send(null);
  }
  
  function updateForJobtitle(selectElement) {
    var request = new XMLHttpRequest();
    request.open("GET", "controller/companydata.php", true);
    console.log(request);
  
    request.onload = function () {
      console.log("Response: " + this.response);
      var companydatas = JSON.parse(this.response);
      console.log("reached");
      console.log(companydatas);
  
      copmanynameSelect = document.getElementById("companyname");
      departementSelect = document.getElementById("departement");
      jobtitleSelect = document.getElementById("jobtitle");
      clearSelectOptions(departementSelect);
      clearSelectOptions(copmanynameSelect);
  
      var selectedIndex = jobtitleSelect.selectedIndex;
  
      for (let index = 0; index < companydatas.length; index++) {
        if (
          companydatas[index].Jobtitle === jobtitleSelect[selectedIndex].value
        ) {
          var value1 = companydatas[index].Departement;
          var value2 = companydatas[index].Companyname;
  
          var opt1 = document.createElement("option");
          var opt2 = document.createElement("option");
  
          opt1.appendChild(document.createTextNode(value1));
          opt2.appendChild(document.createTextNode(value2));
  
          opt1.value = value1;
          opt2.value = value2;
  
          departementSelect.appendChild(opt1);
          copmanynameSelect.appendChild(opt2);
        }
      }
    };
    request.send(null);
  }