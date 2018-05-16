<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width">
  <title>Registro de Atendimento</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <link href="css/style.css" rel="stylesheet">
</head>

<body>
   
  <!-- conteiner registro de atendimento-->
  <div class="col-md-12"><br>
	                    
	              		<a href="index" class="btn btn-default">Home</a>
 </div>
  <center>
    <div>
      <div>
        <center>
          <br>
          
            <h1>Registro de Atendimento</h1><br>
            
            <form action="registro_atendimento" method="post">
            <label for="servico">Escolha o Serviço:</label>    
           	<select name="servico" class="form-control" style="width:400px">    
                    <option value="">Selecione</option>
	                        <c:forEach var="servico" items="${servicos}">
	                            <option value="${servico.sigla}">${servico.nome}</option>
	                        </c:forEach>
               
                  </select>
              
                <br>
                   <label for="subservico">Escolha o Sub-Serviço:</label>
                  <select name= "subservico" class="form-control" style="width:400px">
                  	<option value="">Selecione</option>
	                        <c:forEach var="subservico" items="${subservicos}">
	                            <option value="${subservico.id_servico}">${subservico.nome}</option>
	                        </c:forEach>
                 
                    </select>
                    <br>
                      <button type="submit" class="btn btn-primary">Filtrar</button><br>
                    </form>

                    <main class="container pt-5">
                      <div class="card mb-5">
                        <form action="gerar_atendimento" method="post">
                         
                          <div >
                            <br><table class="table table-bordered table-sm m-0">
                              <thead>
                                <tr>	
                                  <th><b>SENHA</b></th>
                                  <th><b>FILA</b></th>
                                  <th><b>HORÁRIO CHEGADA</b></th>
                                  <th><b>STATUS</b></th>
                                </tr>
                              </thead>
                              <tbody>
                               <c:forEach var="a" items="${atendimentos}">
                                <tr>
	              				<td>${a.id_senha.codigo }</td>
	              				<!-- <td >${f.nome }</td> -->
	              				<td ><fmt:formatDate value="${a.dataInicio }" pattern="HH:mm:ss"/></td>
	             				 <td>${a.status }</td>
	            				</tr>
                                
                                
								</c:forEach>
                                          </tbody>
                                        </table>
                                      </div>
                                    </center>
                                   <button type="submit" class="btn btn-primary">Chamar Senha</button>
                                    
                                    <button type="submit" class="btn btn-primary">Finalizar Atendimento</button>
                                  </form>
                                </div>
                              </div>
                            </div>
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





<!--
                    
                    
                    <select name="fila">
	                        <option value="">Selecione</option>
	                        <c:forEach var="fila" items="${filas}">
	                            <option value="${fila.sigla}">${fila.nome}</option>
	                        </c:forEach>
                    	</select>
                    
                    
                    
                    
                    <option id="male">Abertura de Firma</option>
                    <option id="male">Reconhecimento de Firma</option>
                    <option id="male">Procuração</option>
                    <option id="male">Xerox Autenticada</option>
                    <option id="male">Certidão de Nascimento</option>
                    <option id="male">Certidão de Casamento</option>-->
                    
                    
                    
                    <!--<option id="male">Sub-Serviço 1</option>
                    <option id="male">Sub-Serviço 2</option>
                    <option id="male">Sub-Serviço 3</option>
                    <option id="male">Sub-Serviço 4</option>
                    <option id="male">Sub-Serviço 5</option>
                    <option id="male">Sub-Serviço 6</option>-->
                    
                    
                    
                    
                    
                    
                    
                    
                    <!--  <tr>
                                  <td>
                                    <label class="container">
                                      <input type="radio" value="" name="senha">
                                        <span class="checkmark"></span>
                                      </label>
                                    </td>
                                    <td>PFRF9</td>
                                    <td>Preferencial</td>
                                    <td>20:35</td>
                                    <td>ABERTO</td>
                                  </tr>-->
