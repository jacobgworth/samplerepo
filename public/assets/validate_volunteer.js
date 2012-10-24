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
	if (document.getElementById('txtemail').value == "")
	{
		missing += "\nPlease enter your email.";
	}
	if (document.getElementById('txtmessage').value == "")
	{
		missing += "\nPlease enter a message for us.";
	}
	
	if (missing == "") { return true; }
	else { alert(missing); return false; }
}