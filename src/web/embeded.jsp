<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dados" scope="application" class="br.eti.fml.Dados" />
<jsp:useBean id="combinacao" scope="session" class="br.eti.fml.Combinacao" />
<%--<jsp:useBean id="embeded" scope="session" class="br.eti.fml.EmbededBean" />
<jsp:setProperty name="embeded" property="*" />--%>
<html>
    <head>
        <META HTTP-EQUIV="REFRESH" CONTENT="15">
        <link REL="SHORTCUT ICON" HREF="logoloco.ico">
        <title>Logo Loco - Só as boas (versão embeded)</title>
        
    </head>
    <body style="background-color:white;">
    <div align="center" style="align:center">

    <%
        if (dados.isCarregado()) {
            br.eti.fml.Combinacao nova = dados.pegaBoa();

            if (nova != null) {
                combinacao.redefine(dados.pegaBoa());
    %>   
  
    <div style="text-align:center;width:90%;height:150px;display: table-cell;vertical-align: middle;border: 1px dashed gray;padding:10px;margin:0 auto;">
        <a target="nova" href="http://www.logoloco.com.br/index.jsp"><img style="border:0;align:center" title="<%= combinacao.getEmpresa() %>" src="mini/<%= combinacao.getImagemEmbeded() %>" alt="<%= combinacao.getEmpresa() %>" /></a>
    <br />
    <a style="text-decoration:none;padding-top: 8px;font-size: 12pt;font-style:italic;font-weight: bold;color: #565657;" target="nova" href="http://www.logoloco.com.br/index.jsp"><%= combinacao.getFrase() %></a>
    </div>

    <%
            }
        } // is carregado
    %>
    
    <a style="text-decoration:none;font-size:small;color: #AAAAAA;" target="nova" href="http://www.logoloco.com.br/index.jsp">Powered by LogoLoco&trade;</a>
    </div>

    <script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
    </script>
    <script type="text/javascript">
    _uacct = "UA-2088174-7";
    urchinTracker();
    </script>
</body></html>    