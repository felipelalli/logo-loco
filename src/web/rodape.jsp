<%-- 
    Document   : rodape.jsp
    Created on : 30/11/2007, 00:15:02
    Author     : felipelalli
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="ss" scope="session" class="br.eti.fml.Sessao" />
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.Locale" %>
<%@page import="java.net.URLEncoder" %>

   <p>
        <%
            String uuu2 = "http://www.logoloco.com.br/index.jsp?slogan=" + combinacao.getIndiceFrase() + "&logo=" + combinacao.getIndiceImagem();
            String uuu = URLEncoder.encode(uuu2, "UTF-8");
        %>
        <a class="a2a_dd" href="http://www.addtoany.com/share_save?linkname=Logo%20Loco&amp;linkurl=<%= uuu %>"><img src="http://static.addtoany.com/buttons/share_save_256_24.png" width="256" height="24" border="0" alt="Share"/></a><script type="text/javascript">a2a_linkname="Logo Loco";a2a_linkurl="<%= uuu2 %>";a2a_show_title=1;a2a_num_services=6;a2a_color_main="D7E5ED";a2a_color_border="AECADB";a2a_color_link_text="333333";a2a_color_link_text_hover="333333";a2a_prioritize=["twitter","delicious","facebook","google_gmail"];</script><script type="text/javascript" src="http://static.addtoany.com/menu/locale/pt-BR.js" charset="utf-8"></script><script type="text/javascript" src="http://static.addtoany.com/menu/page.js"></script>
   </p>

   <p>
       <a style="text-decoration:none" href="http://fusion.google.com/ig/add?synd=open&source=ggyp&moduleurl=http://hosting.gmodules.com/ig/gadgets/file/110095814389712584243/logoloco.xml">
           <img style="border:0" src="http://gmodules.com/ig/images/plus_google.gif"/>
       </a>                      
       ou <a title="clique para saber como" target="_blank" href="blog.jsp">coloque no seu site ou blog</a>.
   </p>

    <p class="cinza">
    Um oferecimento: <a class="cinza2" target="_blank" href="http://fml.eti.br/">FML.eti.br</a> e <a class="cinza2" target="_blank" href="http://www.cocadaboa.com/">Cocadaboa.com</a>&trade;
    </p>

    <p class="cinza">
        <small>Campinas, São Paulo, 2007-2010 &copy; <b><a class="cinza" style="text-decoration:none" href="mailto:spamkids@gmail.com?subject=LogoLoco">spamkids@gmail.com</a></b></small>
        <br/><br/>
        <% 
            Locale.setDefault(new Locale("pt", "BR"));
            DecimalFormat df = new DecimalFormat("#,###");
        %>
        <b><%= df.format(dados.getSlogans().size() * dados.getImagens().size()) %></b> combinações e <b><%= df.format(dados.getQuantasBoas()) %></b> boas.<br/>
        Os <i>slogans</i> e logomarcas são sorteados aleatoriamente, site 99% humorístico.</small>
        <br/>
        <% int online = ss.quantosOnline(); %>
        <% if (online <= 1) { %>
        <small>Você está brincando neste site sozinho. Divirta-se!</small>
        <% } else { %>
        <small><span title="Ok! Isto não funciona muito bem...">Há aprox. <%= online %> pessoas brincando ao mesmo tempo.</span></small>
        <% } %>
    </p>
    
    <p class="cinza">
    Inspirado no <a class="cinza2" target="_blank" href="http://blogoscoped.com/logomotto/">Logomotto</a>&trade;
    <br/>Versão brasileira:<br/><embed src="hr.swf" width="60" height="60"></embed>
    </p>
<%--    
    <p>
    <img src="http://www.2w.com.br/imgcontador.php?p=c509463a" alt="Contador de visitas gratis" border="0"/>    
    </p>
--%>    