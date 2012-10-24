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
	} else {
	    if (validateEmail(document.getElementById('txtemail').value) == false) {
	    	missing += "\nPlease enter a valid email address.";
	    }
	} 
	
	if (document.getElementById('txtaddress').value == "")
	{
		missing += "\nPlease enter a address.";
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
		missing += "\nPlease enter your zip code.";
	}
	
	if (document.getElementById('txtchurchname').value == "")
	{
		missing += "\nPlease enter the name of your church.";
	}
	
	if (document.getElementById('txtchurchaddress').value == "")
	{
		missing += "\nPlease enter the address of your church.";
	}
	
	if (document.getElementById('txtchurchcity').value == "")
	{
		missing += "\nPlease enter the city of your church.";
	}
		
	if (document.getElementById('txtchurchstate').value == "")
	{
		missing += "\nPlease enter the state of your church.";
	}
		
	if (document.getElementById('txtchurchzip').value == "")
	{
		missing += "\nPlease enter the zip of your church.";
	}
		
	if (document.getElementById('txtpastorname').value == "")
	{
		missing += "\nPlease enter the name of your pastor.";
	}
		
	if (document.getElementById('txtpastorphone').value == "")
	{
		missing += "\nPlease enter the phone number of your pastor.";
	}
		
	if (document.getElementById('txtmissionname').value == "")
	{
		missing += "\nPlease enter the name of the contact for your mission.";
	}
		
	if (document.getElementById('txtmissionphone').value == "")
	{
		missing += "\nPlease enter the phone number of your mission contact.";
	}
		
	if (document.getElementById('txtchurchwebsite').value == "")
	{
		missing += "\nPlease enter the phone number of your pastor.";
	}
		
	if (document.getElementById('txtmessage').value == "")
	{
		missing += "\nPlease enter a comment for us.";
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