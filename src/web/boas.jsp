<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dados" scope="application" class="br.eti.fml.Dados" />
<jsp:useBean id="boas" scope="session" class="br.eti.fml.BoasBean" />
<jsp:useBean id="combinacao" scope="session" class="br.eti.fml.Combinacao" />
<jsp:setProperty name="boas" property="*" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logo Loco - Só as boas</title>
        <link REL="SHORTCUT ICON" HREF="logoloco.ico">
        
<style type="text/css">
    @import "estilo.css";
</style>

    </head>    
    
    <body>
        <div class="conteudo">
            
        <%
            boolean erro = false;            
            
            if (!dados.isCarregado()) {
                %>Primeira vez: você deve carregar antes.<%
                
                erro = true;
            }                        
            
            boolean exibeOpcoes = true;
            
            if (!erro) {

                if ("boa".equals(boas.getAvaliacao())) {                    
                    dados.salvaBoa(combinacao);
                    combinacao.setVotos(combinacao.getVotos()+1);
                    //exibeOpcoes = false;
                } else if ("ruim".equals(boas.getAvaliacao())) {                    
                    dados.tiraBoa(combinacao);
                    combinacao.setVotos(combinacao.getVotos()-1);
                    //exibeOpcoes = false;
                }  

                br.eti.fml.Combinacao nova = dados.pegaBoa();

                if (nova != null) {
                    combinacao.redefine(dados.pegaBoa());
                } else {
                    erro = true;
%>
                    <a href="index.jsp"><b>Primeirão! Ainda não há boas! Clique aqui para voltar!</b></a>
<%
                }                    

                exibeOpcoes = !combinacao.jaVotou();                                                    
            }

            if (!erro) {
        %>              

        <h1>LogoLoco&trade; <img src="logos/star.png" style="border: 0"/> <small>só as boas</small></h1>
        <p class="rodape"/>

            <div id="area">
                <a href="boas.jsp"><img border="0" title="<%= combinacao.getEmpresa() %>" src="logos/<%= combinacao.getImagem() %>" alt="<%= combinacao.getEmpresa() %>" /></a>
                <br />
                <div class="frase"><%= combinacao.getFrase() %></div>
            </div>

        <p class="rodape">
            <p>
                <small><a title="http://www.logoloco.com.br/index.jsp?slogan=<%= combinacao.getIndiceFrase() %>&logo=<%= combinacao.getIndiceImagem() %>" href="http://www.logoloco.com.br/index.jsp?slogan=<%= combinacao.getIndiceFrase() %>&logo=<%= combinacao.getIndiceImagem() %>"># link para esta combinação</a></small>
            </p>

            <form name="unico" action="boas.jsp" method="POST">
                <table border="0" align="center" cellpadding="10">
                <tr>
                <td valign="top">
                Pontuação: <%= (combinacao.getVotos()<=0)?"nenhum":combinacao.getVotos()==1?(exibeOpcoes?"<b>só um</b>":"<b>só você votou</b>"):("" + combinacao.getVotos()) %>
                <% if (exibeOpcoes) { %>
                <br/><input id="ru" type="radio" name="avaliacao" value="ruim" onClick="document.unico.submit()"/> <img src="logos/boa2.png" onClick="document.unico.ru.click()"/> <a href="#" onClick="document.unico.ru.click()" style="text-decoration:none">Essa é tosca</a>
                <br/><input id="bo" type="radio" name="avaliacao" value="boa" onClick="document.unico.submit()"/> <img src="logos/boa.png" onClick="document.unico.bo.click()"/> <a href="#" onClick="document.unico.bo.click()" style="text-decoration:none">É mesmo ótima!</a>
                <br/><input id="no" type="radio" name="avaliacao" value="normal" onClick="document.unico.submit()"/> <a href="#" onClick="document.unico.no.click()" style="text-decoration:none">Boazinha...</a>
                <% } %>
                </td>
                <%@ include file="propaganda.jsp" %>
		</tr>
		</table>

                <p>
                    <a href="boas.jsp"><b><big>
<%                    
                    String[] frases = {"Sorteia outra boa!",
                                       "Vamos tentar outra boa...",
                                       "Só mais uma boazinha!",
                                       "A próxima deve ser bem melhor!",
                                       "Quero uma boa!",
                                       "Me dá outra boa?",
                                       "Mais um! Mais um!",
                                       "Boua! Manda mais!!",
                                       "Manda outra boa rápido!",
                                       "Será que a próxima é melhor?",
                                       "Coloca a próxima na tela!",
                                       "Joga aí outra boa!",
                                       "Manda mais aê!",
                                       "Só mais uminha vai...",
                                       "Prometo que é a última...",
                                       "Tem mais?",
                                       "Só isso? Quero mais!",
                                       "Viciado? Eu?"};

                    int qual = (int) (Math.random() * frases.length);
%>
                        <%= frases[qual] %>
                        </big></b></a>
                </p>            

                <p class="cinza">
                    <a class="cinza2" href="index.jsp"><img src="logos/voltar.png" style="border: 0"/> Cansei das boas. Quero voltar pro sorteio!</a>
                </p>
<%--
                <p>
                <a name="respond"></a>
<script>
var idcomments_acct = '22ca4a650fbde32e976e1b96d6dfa509';
var idcomments_post_id;
var idcomments_post_url;
</script>
<span id="IDCommentsPostTitle" style="display:none"></span>
<script type='text/javascript' src='http://www.intensedebate.com/js/genericCommentWrapperV2.js'></script>                    
                </p>                
--%>
                <p class="risquinho"/>
                         
                <%@ include file="rodape.jsp" %>

            </form>
        </p>

        <%
            boas.setAvaliacao(null);

          } // !erro
        %>

        </div>
        
        <script src="http://www.google-analytics.com/urchin.js" type="text/javascript">
        </script>
        <script type="text/javascript">
        _uacct = "UA-2088174-7";
        urchinTracker();
        </script>        
    </body>
</html>
