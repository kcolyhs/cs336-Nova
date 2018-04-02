package db336;

public class WebsiteElements {


public static String getHeader() {
	return 
		"<div id=\"header\" style=\"background-color:red;\">\n" + 
		"	<div class = \"page-header\" style=\"padding:20px;margin-bottom:0px;margin-top:0px;color:white\">\n" + 
		"		<h1 >CS336 - NOVA <small style=\"color:white\" align=\"right\">Animal Shelter Database Services</small></h1>\n" + 
		"	</div>	\n" + 
		"	<nav class=\"navbar navbar-inverse\">\n" + 
		"	  <div class=\"container-fluid\">\n" + 
		"	    <div class=\"navbar-header\">\n" + 
		"	      <a class=\"navbar-brand\" href=\"#\">NOVA</a>\n" + 
		"	    </div>\n" + 
		"	    <ul class=\"nav navbar-nav\">\n" + 
		"	      <li class=\"active\"><a href=\"home.jsp\">Home</a></li>\n" + 
		"	      <li class=\"dropdown\">\n" + 
		"		      <a class=\"dropdown-toggle\" data-toggle=\"dropdown\" href=\"#\">Animals\n" + 
		"		        <span class=\"caret\"></span></a>\n" + 
		"		        <ul class=\"dropdown-menu\">\n" + 
		"		          <li><a href=\"createanimal.jsp\">Register</a></li>\n" + 
		"		          <li><a href=\"#\">Search</a></li>\n" + 
		"		          <li><a href=\"#\">Page 1-3</a></li>\n" + 
		"		        </ul>\n" + 
		"	      </li>\n" + 
		"	      <li><a href=\"#\">Page 2</a></li>\n" + 
		"	      <li><a href=\"#\">Page 3</a></li>\n" + 
		"	    </ul>\n" + 
		"	  </div>\n" + 
		"	</nav>\n" + 
		"</div>";
}

}
