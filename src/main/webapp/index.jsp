<html>
<body>
<h2>Hello everybody! Here you can manage your movie application management!</h2>
<!-- Dit is de pagina die eerst getoond wordt bij het opstarten van de site.

 Hiermee wordt je naar de MovieController gestuurd en dan naar het overzichtscherm van de site -->
<%
    response.sendRedirect("movies/showmovies.htm");
%>
</body>
</html>
