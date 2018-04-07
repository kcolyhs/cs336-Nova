package db336;

public class WebsiteElements {


public static String getHeader(boolean loggedIn) {
	String ret = "<div id=\"header\" style=\"background-color:#d9534f;\">\n" + 
			"	<div class = \"page-header\" style=\"padding:20px;margin-bottom:0px;margin-top:0px;color:white\">\n" + 
			"		<h1 >CS336 - NOVA <small style=\"color:white\" align=\"right\">Animal Shelter Database Services</small></h1>\n" + 
			"	</div>	\n" + 
			"	<nav class=\"navbar navbar-inverse\">\n" + 
			"	  <div class=\"container-fluid\">\n" + 
			"    	<div class=\"navbar-header\">\n" + 
			"	     <a class=\"navbar-brand\" href=\"home.jsp\"><span class=\"glyphicon glyphicon-home\"></span> Home</a>\n" + 
			"	    </div>\n" + 
			"	    <ul class=\"nav navbar-nav\">\n" + 
			"      		<li class=\"active\"></li>\n" + 
			"	     	<li class=\"dropdown\">\n" + 
			"		      	<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Animals\n" + 
			"		        <span class=\"caret\"></span></a>\n" + 
			"		        <ul class=\"dropdown-menu\">\n" + 
			"		         	<li><a href=\"createanimal.jsp\">Register an Animal</a></li>\n" + 
			"		         	<li><a href=\"animalquery.jsp\">Search Animals</a></li>\n" +
			"		          	<li><a href=\"adoptform.jsp\">Adopt an Animal</a></li>\n" + 
			"		        </ul>\n" + 
			"	      	</li>\n" + 
			"	      	<li>\n" + 
			"	      		<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Shelters/Fosters\n" + 
			"		        <span class=\"caret\"></span></a>\n" + 
			"		        <ul class=\"dropdown-menu\">\n" + 
			"		         	<li><a href=\"createanimal.jsp\">Register a Shelter</a></li>\n" + 
			"		         	<li><a href=\"shelterquery.jsp\">Search for Shelters</a></li>\n" + 
			"		         	<li><a href=\"createfoster.jsp\">Register a Foster Home</a></li>\n" + 
			"		         	<li><a href=\"queryfoster\">Search for Foster Homes</a></li>\n" + 
			"		        </ul>\n" + 
			"	        </li>\n" + 
			"	      	<li>\n" + 
			"	      	<a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\"> Vets/Medicine\n" + 
			"		        <span class=\"caret\"></span></a>\n" + 
			"		        <ul class=\"dropdown-menu\">\n" + 
			"		         	<li><a href=\"createanimal.jsp\">Register a Veterinarian</a></li>\n" + 
			"		         	<li><a href=\"#\">Search for a Veterinarian</a></li>\n" + 
			"		          	<li><a href=\"#\">Check Vaccination Records</a></li>\n" + 
			"		        </ul>\n" + 
			"	        </li>\n" + 
			"	      	<li><a href=\"regadopt.jsp\">Register to Adopt</a></li>\n" + 
			"	    </ul>\n" + 
			"	    <ul class=\"nav navbar-nav\"style=\"float:right;align-text:right\">\n";
	if(loggedIn) {
		ret +="	    	<li><a href=\"logout.jsp\"><span class=\"glyphicon glyphicon-lock\"></span> Logout</a></li>\n";
	}else {
		ret +=	"	    	<li><a href=\"login.jsp\"><span class=\"glyphicon glyphicon-user\"></span> Login</a></li>\n" + 
				"	    	<li><a href=\"createuser.jsp\"><span class=\"glyphicon glyphicon-pencil\"></span> Register</a></li>\n" ;
	}
			ret+=
			"	    </ul>\n" + 
			"	  </div>\n" + 
			"	  \n" + 
			"	</nav>\n" + 
			"</div>";
	return ret;
}


}
