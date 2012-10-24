function validate() {
	//verify fields are not empty	
	var missing = ""
	if (document.getElementById('txtname').value == "")
	{
		missing += "Please enter your name.";
	}
	if (document.getElementById('txtphone').value == "")
	{
		missing += "\nPlease enter your phone number.";
	}
	if (document.getElementById('txtchildname').value == "")
	{
		missing += "\nPlease enter your child's name.";
	}
	if (document.getElementById('txtchildnumber').value == "")
	{
		missing += "\nPlease enter your child's number.";
	}
	if (document.getElementById('txtemail').value == "")
	{
		missing += "\nPlease enter your email.";
	} else {
	    if (validateEmail(document.getElementById('txtemail').value) == false) {
	    	missing += "\nPlease enter a valid email address.";
	    }
	} 
	if (document.getElementById('txtmessage').value == "")
	{
		missing += "\nPlease enter a message for us.";
	}
		
	
	if (missing == "") { return true; }
	else { alert(missing); return false; }
}

function validateEmail(elementValue){
   //test elementValue against regex for email
   var reg = new RegExp("[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?");
   var result = reg.test(elementValue);
   return result;
} 