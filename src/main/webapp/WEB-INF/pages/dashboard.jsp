<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="br.LojaFrangos.model.Usuario" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    Usuario usuario = (Usuario) session.getAttribute("usuarioLogado");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <title>Dashboard - FrangoMania</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        body {
            background-color: #121212;
            color: #fff;
            padding-top: 80px;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        main {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .navbar {
            background-color: #b30000 !important;
        }

        .navbar-brand, .nav-link, .user-info span {
            color: #fff !important;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        .btn-group-custom {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 1.2rem;
            width: 90%;
            max-width: 800px;
        }

        .btn-group-custom .btn {
            padding: 1rem;
            font-size: 1.1rem;
            font-weight: bold;
            color: #fff;
            border: none;
            border-radius: 0.75rem;
            transition: all 0.3s ease-in-out;
        }

        .btn-verde {
            background-color: #007f5f;
        }

        .btn-verde:hover {
            background-color: #00b383;
        }

        .btn-amarelo {
            background-color: #f0ad00;
            color: #000;
        }

        .btn-amarelo:hover {
            background-color: #ffd633;
        }

        .btn-vermelho {
            background-color: #d40000;
        }

        .btn-vermelho:hover {
            background-color: #ff3333;
        }

        .btn-roxo {
            background-color: #6f42c1;
        }

        .btn-roxo:hover {
            background-color: #a066f2;
        }

        footer {
            background-color: #000;
            color: #fff;
            text-align: center;
            padding: 1rem;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">FrangoMania</a>
        <ul class="navbar-nav me-auto">
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/usuario">Usuários</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/funcionario">Funcionários</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pedidos">Pedidos</a></li>
            <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Painel</a></li>
        </ul>
        <div class="user-info ms-auto">
            <span>Bem-vindo(a), <strong><%= usuario.getEmail() %></strong></span>
            <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Sair</a>
        </div>
    </div>
</nav>

<main>
    <div class="btn-group-custom">
        <a href="${pageContext.request.contextPath}/usuario" class="btn btn-verde">Cadastrar Usuários</a>
        <a href="${pageContext.request.contextPath}/funcionario" class="btn btn-amarelo">Funcionários</a>
        <a href="${pageContext.request.contextPath}/notaservico" class="btn btn-vermelho">Serviços</a>
        <a href="${pageContext.request.contextPath}/painel" class="btn btn-roxo">Painel</a>
    </div>
</main>

<footer>
    FrangoMania — há mais de 10 anos garantindo um frango frito delicioso para você! | WhatsApp: (55) 8002-8922
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
