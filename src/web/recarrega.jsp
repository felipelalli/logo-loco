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
        boolean erro = false;
        dados.mandaAtualizar();

        if (!dados.isCarregado()) {
            try {
                br.eti.fml.LeDadosDeXLS
                        .le(
                            /*
                            new java.io.FileInputStream(
                                "/home/felipelalli/wa/fml/anp-dev/db/data.xls")
                            */
                            new java.net.URL(
                                "http://spreadsheets.google.com/pub?key=paZhXAXgIs6bolfbh0JyNZA&output=xls")
                                .openStream(),
                            dados);
                
                %>Perfeito! Carregado com sucesso! <%= dados.getSlogans().size() %>
                    slogans e <%= dados.getImagens().size() %> marcas carregadas.
                    Combinações possíveis:
                    <%= (dados.getSlogans().size() *dados.getImagens().size())  %>.
                    <%

            } catch (Exception e) {
                erro = true;

                %><br/>
                <b style="color:red">
                   Erro ao ler os dados!</b>
                   <br/><i><small>Exceção: <%= e + "" %></small>
                   <p>
                   Pode ter ocorrido um problema na sua conexão.
                   Verifique sua internet e <a href="index.jsp">tente novamente</a>.

                   </i>
                <%
            }                 
        }
%>       
    
    </body>
</html>
