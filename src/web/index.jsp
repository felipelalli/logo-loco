<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<%
    request.setCharacterEncoding("UTF-8");
%>

<jsp:useBean id="dados" scope="application" class="br.eti.fml.Dados" />
<jsp:useBean id="info" scope="session" class="br.eti.fml.InfoBean" />
<jsp:useBean id="combinacao" scope="session" class="br.eti.fml.Combinacao" />
<jsp:setProperty name="info" property="*" />

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logo Loco</title>
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
            
            if (!erro) {
                
                if ("boa".equals(info.getAvaliacao())) {
                    dados.salvaBoa(combinacao);
                }

                Integer logo;
                Integer slogan;

                if (info.getLogo() != null) {
                    logo = info.getLogo();
                } else {
                    logo = combinacao.sorteiaLogo(dados);
                }

                if (info.getSlogan() != null) {
                    slogan = info.getSlogan();
                } else {
                    slogan = combinacao.sorteiaSlogan(dados);
                }

                combinacao.setIndices(dados, slogan, logo);

                Integer proximoLogo = combinacao.sorteiaLogo(dados);
                Integer proximoSlogan = combinacao.sorteiaSlogan(dados);
        %>              

        <h1>LogoLoco&trade;</h1>
        <p class="rodape"/>

            <div id="area">
                <a href="index.jsp?slogan=<%= proximoSlogan %>&logo=<%= proximoLogo %>"><img border="0" title="<%= combinacao.getEmpresa() %>" src="logos/<%= combinacao.getImagem() %>" alt="<%= combinacao.getEmpresa() %>" /></a>
                <br />
                <div class="frase"><%= combinacao.getFrase() %></div>
            </div>

        <p class="rodape">
            <form name="unico" action="index.jsp?slogan=<%= proximoSlogan %>&logo=<%= proximoLogo %>" method="POST">

                <table border="0" align="center" cellpadding="10">
                <tr>
                <td valign="top">
                    <% if (!combinacao.jaVotou()) { %>
                    <p>
                    <b>Como ficou a combinação?</b><br/>
                    <input type="radio" id="nor" onClick="document.unico.submit()" name="avaliacao" value="normal" /> <a href="#" onClick="document.unico.nor.click()" style="text-decoration:none">Normal...</a>
                    <br/>
                    <input id="boua" type="radio" name="avaliacao" value="boa" onClick="document.unico.submit()" />
                    <img src="logos/boa.png" onClick="document.unico.boua.click()"/> <a href="#" onClick="document.unico.boua.click()" style="text-decoration:none">Boua!</a>
                    </p>       
                    <% } %>
                </td>
                <%@ include file="propaganda.jsp" %>
		</tr>
		</table>

                <p>
                    <a title="Clique aqui para mais!" href="index.jsp?slogan=<%= proximoSlogan %>&logo=<%= proximoLogo %>"><b><big>
<%                    
                    String[] frases = {"Me dá logo a próxima!",
                                       "Quero mais!",
                                       "Gera outra rápido!",
                                       "Manda outra!",
                                       "Atualiza essa budega!",
                                       "Só mais umazinha!",
                                       "Sorteia outra coisa!",
                                       "Quero tentar a sorte!",
                                       "Tô curioso pra ver a próxima",
                                       "Tô sem tempo, mas...",
                                       "Não acredito! Quero mais!",
                                       "Mais! Mais! Mais!!",
                                       "De nooooooooooooovo!",
                                       "Quero outra logomarca maluca!",
                                       "Dá outra vai!",
                                       "Prometo que é a última!",
                                       "Outra! Outra! Outra!",
                                       "Ainda tô no pique!",
                                       "Uia! Manda mais!",
                                       "Pelas barbas do profeta! Mais!",
                                       "Queria tanto ver outra...",
                                       "Bota outra na tela!",
                                       "Seu zero-dois, manda outra ou pede pra sair!",
                                       "A curiosidade matou o gato",
                                       "Gera outro logoloco!",
                                       "Se não mandar outra logo, vou para o Cocadaboa!",
                                       "Pé de breque! Vai mais!",
                                       "Estou com sede! Dá mais!",
                                       "Você não atualiza sozinho? Quero mais!"};
                    
                    int qual = (int) (Math.random() * frases.length);
%>
                        <%= frases[qual] %>
                        </big></b></a>
                </p>            

                <p class="cinza">
                    <a class="cinza2" href="boas.jsp"><img src="logos/star.png" style="border: 0"/> Quero ver só as boas!</a>
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
                
                <p class="risquinho"/>
--%>

                <p class="risquinho"/>
                <%@ include file="rodape.jsp" %>

            </form>
        </p>

        <%
            info.setAvaliacao(null);
        
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
