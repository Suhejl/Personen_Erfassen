window.onload = loadPersonalData();

function loadPersonalData() {
  var request = new XMLHttpRequest();
  request.open("GET", "controller/personaldata.php", true);
  console.log(request);

  request.onload = function () {
    console.log("Response: " + this.response);
    var json = JSON.parse(this.response);
    console.log("reached");
    console.log(json);
    let table = document.getElementById("personalDataTableBody");

    for (let index = 0; index < json.length; index++) {
      let row = table.insertRow(index);
      let cell1 = row.insertCell(0);
      let cell2 = row.insertCell(1);
      let cell3 = row.insertCell(2);
      let cell4 = row.insertCell(3);
      let cell5 = row.insertCell(4);
      let cell6 = row.insertCell(5);
      let cell7 = row.insertCell(6);
      let cell8 = row.insertCell(7);
      let cell9 = row.insertCell(8);
      let cell10 = row.insertCell(9);
      let cell11 = row.insertCell(10);
      let cell12 = row.insertCell(11);
      let cell13 = row.insertCell(12);

      cell1.innerHTML = json[index].Firstname;
      cell2.innerHTML = json[index].Lastname;
      cell3.innerHTML = json[index].Email;
      cell4.innerHTML = json[index].Birthday;
      cell5.innerHTML = json[index].AHV;
      cell6.innerHTML = json[index].Personalnumber;
      cell7.innerHTML = json[index].Phonenumber;
      cell8.innerHTML = json[index].Companyname;
      cell9.innerHTML = json[index].Departement;
      cell10.innerHTML = json[index].Jobtitle;
      cell11.innerHTML = json[index].Jobdescription;
      console.log(
        "Trying to send id to edit Data: " + json[index].Personaldata_ID
      );
      cell12.innerHTML = `<button class="btn btn-custom_style" onclick="loadEditView(${json[index].Personaldata_ID})">Edit</button>`;
      cell13.innerHTML = `<button class="btn btn-custom_style--delete" onclick="loadDeleteModal(this, ${json[index].Personaldata_ID})">Delete</button>`;
    }

    var modalDIV = document.getElementById("modalDIV");

    var deleteBtn = document.createElement("button");
    deleteBtn.id = "deleteConfirmBtn";
    deleteBtn.className = "btn btn-custom_style--delete";
    deleteBtn.textContent = "Delete";

    modalDIV.appendChild(deleteBtn);

    // for (var personaldata of json) {
    //     tableData +=
    //     `<tr>
    //     <td>${personaldata.Firstname}</td>
    //     <td>${personaldata.Lastname}</td>
    //     <td>${personaldata.Email}</td>
    //     <td>${personaldata.Birthday}</td>
    //     <td>${personaldata.AHV}</td>
    //     <td>${personaldata.Personalnumber}</td>
    //     <td>${personaldata.Phonenumber}</td>
    //     <td>${personaldata.Companyname}</td>
    //     <td>${personaldata.Department}</td>
    //     <td>${personaldata.Jobtitle}</td>
    //     <td>${personaldata.Jobdescription}</td>
    //     </tr>`;
    // }
  };
  request.send(null);
}

function loadEditView(id) {
  console.log("Reached Edit data with id: " + id);

  if (id) {
    window.location = `edit?id=${id}`;
  }
}

function loadDeleteModal(btn, id) {
  var modal = document.getElementById("deleteConfirmation");

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[0];

  // When the user clicks the button, open the modal
  btn.onclick = function () {
    modal.style.display = "block";
    deleteConfirmBtn = document.getElementById("deleteConfirmBtn");
    deleteConfirmBtn.onclick = function (event) {
      deleteRow(id);
      location.reload();
    };
  };

  // When the user clicks on <span> (x), close the modal
  span.onclick = function () {
    modal.style.display = "none";
  };

  // When the user clicks anywhere outside of the modal, close it
  window.onclick = function (event) {
    if (event.target == modal) {
      modal.style.display = "none";
    }
  };
}

function deleteRow(id) {
  console.log("Reached delete: " + id);

  var request = new XMLHttpRequest();
  request.open("GET", `controller/personaldata.php?id=${id}&method=delete`, true);

  request.onload = function () {
      console.log('Reached Onload');
      console.log(this.response);
      

  }
 console.log(request);

  return request.send(null);
}
