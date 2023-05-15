document.addEventListener("DOMContentLoaded", function () {
    const tagNumber = document.getElementById('tagNumber');
    const errorField = document.getElementById('errorField');

    tagNumber.addEventListener("keydown", function (e) {
        errorField.innerHTML = '';
    });

    loadData();

    const checkInButton = document.getElementById("btnCheckIn");
    checkInButton.addEventListener("click", function (event) {
        const textTagNumber = document.getElementById("tagNumber");
        
        if (!isProvided(textTagNumber)) return;
        if (hasSpecialCharacters(textTagNumber)) return;

        event.preventDefault();

        var formData = {
            TagNumber: textTagNumber.value
        };

        fetch('/Home/CheckIn', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(formData)
        }).then(response => response.json())
            .then(data => {
                let response = JSON.parse(data);
                if (response.Success) {
                    toastr.success(response.Message, 'Success', { timeOut: 5000 });
                    loadData();
                    textTagNumber.value = '';
                } else {
                    toastr.error(response.Message, 'Failed', { timeOut: 5000 });
                }
            })
            .catch(error => { toastr.error(error, 'Error', { timeOut: 5000 }); });

    });

    const checkOutButton = document.getElementById("btnCheckOut");
    checkOutButton.addEventListener("click", function (event) {

        const textTagNumber = document.getElementById("tagNumber");

        if (!isProvided(textTagNumber)) return;
        if (hasSpecialCharacters(textTagNumber)) return;

        event.preventDefault();
        var formData = {
            TagNumber: textTagNumber.value
        };


        fetch('/Home/CheckOut', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify(formData)
        })
            .then(response => response.json())
            .then(data => {
                let response = JSON.parse(data);
                if (response.Success) {
                    toastr.success(response.Message, 'Success', { timeOut: 5000 });
                    toastr.info('', `Fee to be charged: $${response.FeeCharged}`, { timeOut: 10000 });
                    loadData();
                    textTagNumber.value = '';
                } else {
                    toastr.error(response.Message, 'Failed', { timeOut: 5000 });
                }
            })
            .catch(error => { toastr.error(error, 'Error', { timeOut: 5000 }); });
    });

    const statsButton = document.getElementById("btnStats");
    statsButton.addEventListener("click", function (event) {
        event.preventDefault();

        fetch('/Home/GetStatistics', {
            method: 'Get'
        }).then(response => response.text())
            .then(data => {
                const modelContainer = document.getElementById('modal-container');
                modelContainer.innerHTML = data;
                $('#modal').modal('show');
            })
            .catch(error => { toastr.error(error, 'Error', { timeOut: 5000 }); });
    });
});

function loadData() {
    $("#tblCars tbody tr").remove();
    fetch('/Home/GetParkedCarsData')
        .then(response => response.json())
        .then(data => {
            const table = document.getElementById('tblCars');
            const tbody = table.getElementsByTagName("tbody")[0];
            const parkingLotData = JSON.parse(data);

            const vehicals = parkingLotData.Vehicals;
            const parkingLot = parkingLotData.ParkingLot;


            vehicals.forEach(car => {
                const row = document.createElement("tr");
                tbody.appendChild(row);

                const tagNumberCell = document.createElement("td");
                tagNumberCell.textContent = car.TagNumber;
                row.appendChild(tagNumberCell);

                const checkInCell = document.createElement("td");
                checkInCell.textContent = car.CheckInTime;
                row.appendChild(checkInCell);


                const elapsedTimeCell = document.createElement("td");
                elapsedTimeCell.textContent = parseInt(car.ElapsedTime) > 1 ? car.ElapsedTime + ' hours' : car.ElapsedTime + ' hour';
                row.appendChild(elapsedTimeCell);
            });

            const totalSpots = document.getElementById('totalSpots');
            const hourlyFee = document.getElementById('hourlyFee');
            const availableSpots = document.getElementById('availableSpots');
            const spotsTaken = document.getElementById('spotsTaken');

            totalSpots.innerHTML = parkingLot.TotalSpots;
            hourlyFee.innerHTML = parkingLot.HourlyFee;

            spotsTaken.innerHTML = vehicals.length;
            availableSpots.innerHTML = (parseInt(parkingLot.TotalSpots) - parseInt(vehicals.length));

        })
        .catch(error => {
            toastr.error(error, 'Error', { timeOut: 5000 });
        });

};

function isProvided(tagNumber) {

    const errorField = document.getElementById('errorField');
    if (tagNumber && !tagNumber.value) {
        errorField.innerHTML = 'Tag number is required.';
        return false;
    } else {
        return true;
    }


}

function hasSpecialCharacters(tagNumber) {
    const specialChars = /[`!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
    const errorField = document.getElementById('errorField');
    if (tagNumber && specialChars.test(tagNumber.value)) {
        errorField.innerHTML = 'Special characters are not allowed.';
        return true;
    } else {
        return false;
    }
}