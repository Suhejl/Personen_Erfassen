function loadPersonalData(){
    var request = new XMLHttpRequest();
    request.open('GET', '../controller/personaldata.php', true);

    request.onload = function(){
        var json = JSON.parse(this.response);
        let tableData = "";

        for (var personaldata of json) {
            tableData += 
            `<tr>
            <td>${personaldata.Firstname}</td>
            <td>${personaldata.Lastname}</td>
            <td>${personaldata.Email}</td>
            <td>${personaldata.Birthday}</td>
            <td>${personaldata.AHV}</td>
            <td>${personaldata.Personalnumber}</td>
            <td>${personaldata.Phonenumber}</td>
            <td>${personaldata.Companyname}</td>
            <td>${personaldata.Department}</td>
            <td>${personaldata.Jobtitle}</td>
            <td>${personaldata.Jobdescription}</td>
            </tr>`;
        }
    }
}