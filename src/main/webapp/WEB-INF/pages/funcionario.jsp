<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <title>Funcionários - FrangoMania</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>

    <style>
        body {
            background-color: #121212;
            color: #fff;
            padding-top: 80px;
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            font-family: 'Segoe UI', sans-serif;
        }

        main {
            flex: 1;
            margin: 2rem auto;
            width: 90%;
            max-width: 1000px;
        }

        .navbar {
            background-color: #b30000 !important;
        }

        .navbar-brand {
            color: #fff !important;
            font-weight: bold;
            font-size: 1.6rem;
        }

        .nav-link, .user-info span {
            color: #fff !important;
        }

        .user-info {
            display: flex;
            align-items: center;
            gap: 1rem;
        }

        label {
            font-weight: 600;
        }

        input, select, textarea {
            background-color: #1e1e1e;
            border: 1px solid #444;
            color: #fff;
        }

        input::placeholder, textarea::placeholder {
            color: #bbb;
        }

        input:focus, select:focus, textarea:focus {
            background-color: #2e2e2e;
            border-color: #ff4d4d;
            outline: none;
        }

        .btn-success {
            background-color: #d40000;
            border-color: #a10000;
        }

        .btn-success:hover {
            background-color: #ff1a1a;
            border-color: #cc0000;
        }

        .btn-danger {
            background-color: #880000;
        }

        .btn-danger:hover {
            background-color: #ff3333;
        }

        .btn-warning {
            background-color: #ffaa00;
            color: #000;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #1e1e1e;
        }

        table th, table td {
            padding: 0.75rem 1rem;
            border: 1px solid #333;
            text-align: left;
        }

        table th {
            background-color: #b30000;
            color: #fff;
        }

        footer {
            background-color: #000;
            color: #fff;
            text-align: center;
            padding: 1rem 0;
            font-size: 0.9rem;
        }
    </style>
</head>

<body>
<nav class="navbar navbar-expand-lg fixed-top shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard">FrangoMania</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                aria-controls="navbarNav" aria-expanded="false" aria-label="Alternar navegação">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/usuario">Usuários</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/funcionario">Funcionários</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/pedidos">Pedidos</a></li>
                <li class="nav-item"><a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Painel</a></li>
            </ul>
            <div class="user-info ms-auto">
                <span>Bem-vindo, <strong>${usuarioLogado.email}</strong></span>
                <a href="${pageContext.request.contextPath}/logout" class="btn btn-danger btn-sm">Sair</a>
            </div>
        </div>
    </div>
</nav>

<main>
    <h1 class="mb-4">${funcionarioEditar != null ? 'Editar Funcionário da Loja' : 'Cadastro de Funcionários'}</h1>

    <form action="${pageContext.request.contextPath}/funcionario" method="post" class="mb-5">
        <c:if test="${funcionarioEditar != null}">
            <input type="hidden" name="id" value="${funcionarioEditar.id}"/>
        </c:if>

        <div class="mb-3">
            <label for="nome" class="form-label">Nome</label>
            <input type="text" id="nome" name="nome" placeholder="Ex: João dos Frangos"
                   class="form-control"
                   value="${funcionarioEditar != null ? funcionarioEditar.nome : ''}" required>
        </div>

        <div class="mb-3">
            <label for="cargo" class="form-label">Cargo</label>
            <input type="text" id="cargo" name="cargo" placeholder="Ex: Atendente, Cozinheiro"
                   class="form-control"
                   value="${funcionarioEditar != null ? funcionarioEditar.cargo : ''}" required>
        </div>

        <button type="submit" class="btn btn-success">
            ${funcionarioEditar != null ? 'Salvar Alterações' : 'Cadastrar Funcionário'}
        </button>
    </form>

    <c:if test="${not empty msg}">
        <div class="alert alert-info">${msg}</div>
    </c:if>

    <h2 class="mb-3">Lista de Funcionários</h2>
    <table>
        <thead>
        <tr>
            <th>Nome</th>
            <th>Cargo</th>
            <th colspan="2">Ações</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="funcionario" items="${funcionarios}">
            <tr>
                <td>${funcionario.nome}</td>
                <td>${funcionario.cargo}</td>
                <td>
                    <a href="${pageContext.request.contextPath}/funcionario?opcao=editar&&info=${funcionario.id}"
                       class="btn btn-sm btn-warning">Editar</a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/funcionario?opcao=excluir&&info=${funcionario.id}"
                       class="btn btn-sm btn-danger">Excluir</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</main>

<footer>
    FrangoMania — há mais de 10 anos garantindo um frango frito delicioso para você! | WhatsApp: (55) 8002-8922
</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
