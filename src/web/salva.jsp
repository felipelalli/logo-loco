<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dados" scope="application" class="br.eti.fml.Dados" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logo Loco</title>
        <link REL="SHORTCUT ICON" HREF="logoloco.ico">
    </head>    
    
    <body>
<%
    String onde = dados.salvaNoDisco();
%>        
    Dados gravados com sucesso em "<%= onde %>".

    </body>
</html>
