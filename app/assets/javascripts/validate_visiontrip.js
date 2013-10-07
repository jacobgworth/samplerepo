function validate() {
	//verify fields are not empty	
	var missing = ""
	if (document.getElementById('txtfirst').value == "")
	{
		missing += "Please enter your first name.";
	}
	if (document.getElementById('txtlast').value == "")
	{
		missing += "Please enter your last name.";
	}
	if (document.getElementById('txtphone').value == "")
	{
		missing += "\nPlease enter your phone number.";
	}
	if (document.getElementById('txtemail').value == "")
	{
		missing += "\nPlease enter your email.";
	} else {
	    if (validateEmail(document.getElementById('txtemail').value) == false) {
	    	missing += "\nPlease enter a valid email address.";
	    }
	} 
	if (document.getElementById('txtchurch').value == "")
	{
		missing += "\nPlease enter the address of your church.";
	}
	if (document.getElementById('txtcity').value == "")
	{
		missing += "\nPlease enter your city.";
	}
	if (document.getElementById('txtstate').value == "")
	{
		missing += "\nPlease enter your state.";
	}
	if (document.getElementById('txtzip').value == "")
	{
		missing += "\nPlease enter your zip.";
	}
	if (document.getElementById('txtdatesinterested').value == "")
	{
		missing += "\nPlease enter the dates you are interested in.";
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
