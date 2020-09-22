window.onload = loadDepartementsAndJobtitlesAndCompanynames();

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

function updateForCompanyname() {
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

function updateForDepartemen(selectElement) {
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

document.addEventListener('DOMContentLoaded', function(){
    document.querySelectorAll('.form__input').forEach(function(input){
        input.addEventListener('input', function(){
            this.className = this.className.replace(/form__input--error ?/, '') // form__input--error class is removed (replaced with nothing) with Regex. " ?" means, that the whitespace at the end is optional.
        });

        function success() {
            if (document.getElementById('ahvNr').value === "") {
                document.getElementsByClassName('form__btn').disabled = true;
            } else {
                document.getElementsByClassName('form__btn').disabled = false
            }
            
        }

        if(input.id === 'ahvNr'){
            input.addEventListener('change', function(){

                var regexAHV = /\d{3}.\d{4}.\d{4}.\d{2}/;
                let isValid = regexAHV.test(this.value);                
                console.log(isValid);
                
                if(!isValid){
                    input.classList.add('form__input--error');
                }
            })
        }

        if(input.id === 'email'){
            input.addEventListener('change', function(){

                var regex = /\S+@\S+\.\S+/;
                let isValid = regex.test(this.value);                
                console.log(isValid);
                
                if(!isValid){
                    input.classList.add('form__input--error');
                }
            })
        }
    });
  });
