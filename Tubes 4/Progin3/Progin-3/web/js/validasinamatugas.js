
function NamaTugasValidation()
{
	pola = /^[a-zA-Z0-9 ]{1,25}$/;
	var z = document.formt.namaTask;
	if (!pola.test(z.value)) {
		document.getElementById('warningtask').style.color="RED";
		
		if(z.value.length>25) {
		document.getElementById('warningtask').innerHTML="Maksimal 25 karakter";
		return false;
		}
		else {
		document.getElementById('warningtask').innerHTML="Harus alphanumeric";
		return false;
		}
		
	} else {
		document.getElementById('warningtask').style.color="#666666";
		document.getElementById('warningtask').innerHTML="judul task";
		return true;
	} 
}

function show2() {
	document.getElementById("attach2").style.display="block";
	document.getElementById("button1").style.display="none";
	document.getElementById("tambahan1").style.display="block";
	}
function show3() {
	document.getElementById("attach3").style.display="block";
	document.getElementById("button2").style.display="none";
	document.getElementById("tambahan2").style.display="block";
	}
function show4() {
	document.getElementById("attach4").style.display="block";
	document.getElementById("button3").style.display="none";
	document.getElementById("tambahan3").style.display="block";
	}
function showa() {
	document.getElementById("assignee2").style.display="block";
	document.getElementById("buttona").style.display="none";
	document.getElementById("asg2").style.display="block";
	}
function showb() {
	document.getElementById("assignee3").style.display="block";
	document.getElementById("buttonb").style.display="none";
	document.getElementById("asg3").style.display="block";
	}
	
function validateall() {
console.log("masuk");
	if(NamaTugasValidation()) {
		var z = document.formt.attach.value.length;
		if(z>0) {
		var z = document.formt.assignee.value.length;
		if(z>0) {
		var z = document.formt.deadline.value.length;
		if(z>0) {
		var z = document.formt.tag.value.length;
		if(z>0) {
		console.log(z);
		return true;
		} else return false;
		} else return false;
		} else return false;
		} else return false;
		
	}
	else return false;
	
}
	
function submitform() {
    document.getElementById("kategoriTask").disabled = false; 
if(validateall()) document.formt.submit();
else {}
}
