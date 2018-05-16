<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>Painel de Atendimento</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
  
</head>

<body>
 
  <!-- conteiner painel de atendimento-->
  <div>
    <div>
    <div class="col-md-12">
	                    
	              		<a href="index" class="btn btn-default">Home</a>
	                 
	                </div>
      <center><h1>Painel de Atendimento</h1><br>
      <div >
        <div>
          <table>
            <thead>
            <table class="table table-bordered table-sm m-1">
              <tr>
               	<th><b>Senha</b></th>
                <th><b>Horário Chegada</b></th>
                <th><b>Prév. Início</b></th>
                <th><b>Prév. Fim</b></th>
              </tr>
            </thead>
          </table>
        </div>
      <div>
        
        <table class="table table-bordered table-sm m-0">
          <tbody>
             <c:forEach var="a" items="${atendimentos}">
	            <tr>
	              <td>${a.id_senha.codigo }</td>
	              <td ><fmt:formatDate value="${a.dataInicio }" pattern="HH:mm:ss"/></td>
	              <td ><fmt:formatDate value="${a.previsaoInicio }" pattern="HH:mm:ss"/></td>
	              <td><fmt:formatDate value="${a.previsaoTermino }" pattern="HH:mm:ss"/></td>
	            </tr>
             </c:forEach>
          </tbody>
        </table>
      </center>
      	<div id="actions">
	                
    </div>
  </div>
</div>
</div>


<!--Meu JS-->
<script src="js/meuJS.js"></script>
<!-- script barra de rolagem-->
<script src="vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
<script>
$('.js-pscroll').each(function(){
  var ps = new PerfectScrollbar(this);

  $(window).on('resize', function(){
    ps.update();
  })
});
</script>

    </body>
</html>
