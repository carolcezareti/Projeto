<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Gerar Senha</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
	</head>
	<body>
		<div id="main" class="container">
		<div class="col-md-12"><br>
	                    
	              		<a href="index" class="btn btn-default">Home</a>
	                 
	                </div>
			<center><h3>Gerador de Senha</h3>
			<form action="gera_senha" method="post">
				<div>
	                <div>
	                	<label for="fila">Escolha o Tipo de Atendimento:</label>
	                	
	                	<select name="fila">
	                        <option value="">Selecione</option>
	                        <c:forEach var="fila" items="${filas}">
	                            <option value="${fila.sigla}">${fila.nome}</option>
	                        </c:forEach>
                    	</select>
	                </div>
	                <div class="form-group col-md-12">
	                    <label for="servico">Escolha o Serviço:</label>
	                    <select name="servico">
	                        <option value="">Selecione</option>
	                        <c:forEach var="servico" items="${servicos}">
	                            <option value="${servico.sigla}">${servico.nome}</option>
	                        </c:forEach>
	                    </select>
                	</div>
                </div>
                <div id="actions">
	                <div class="col-md-12">
	                    
	              		<a href="index" class="btn btn-default">Cancelar</a>
	                    <button type="submit" class="btn btn-primary">Gerar Senha</button>	                    
	                </div>	                
	            </div>	        
			</form>			
		</div>
		</center>
	</body>
</html>