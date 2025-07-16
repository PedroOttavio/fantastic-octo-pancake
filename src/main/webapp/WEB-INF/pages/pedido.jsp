<%@page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page isELIgnored="false" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8"/>
    <title>Pedidos - FrangoMania</title>
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
    <h1 class="mb-4">${pedidoEditar != null ? 'Editar Pedido' : 'Cadastro de Pedido'}</h1>

    <form action="${pageContext.request.contextPath}/pedidos" method="post" class="mb-5">
        <c:if test="${pedidoEditar != null}">
            <input type="hidden" name="codigo_pedido" value="${pedidoEditar.codigo_pedido}" />
        </c:if>

        <div class="mb-3">
            <label for="descricao" class="form-label">Descrição do Pedido</label>
            <textarea id="descricao" name="descricao" rows="3" placeholder="Ex: 2 baldes de frango + refrigerante"
                      class="form-control" required>${pedidoEditar != null ? pedidoEditar.descricao : ''}</textarea>
        </div>

        <div class="mb-3">
            <label for="valor" class="form-label">Valor (R$)</label>
            <input type="number" step="0.01" id="valor" name="valor" placeholder="Ex: 49.90"
                   class="form-control"
                   value="${pedidoEditar != null ? pedidoEditar.valor : ''}" required>
        </div>

        <div class="mb-3">
            <label for="tipo_pedido" class="form-label">Tipo de Pedido</label>
            <select id="tipo_pedido" name="tipo_pedido" class="form-select" required>
                <option value="">Selecione o tipo</option>
                <option value="Presencial" <c:if test="${pedidoEditar != null && pedidoEditar.tipo_pedido == 'Presencial'}">selected</c:if>>Presencial</option>
                <option value="Delivery" <c:if test="${pedidoEditar != null && pedidoEditar.tipo_pedido == 'Delivery'}">selected</c:if>>Delivery</option>
            </select>
        </div>

        <div class="mb-3">
            <label for="funcionarioId" class="form-label">Funcionário Responsável</label>
            <select id="funcionarioId" name="funcionarioId" class="form-select" required>
                <option value="">Selecione o funcionário</option>
                <c:forEach var="func" items="${funcionarios}">
                    <option value="${func.id}"
                            <c:if test="${pedidoEditar != null && pedidoEditar.funcionario != null && pedidoEditar.funcionario.id == func.id}">
                                selected
                            </c:if>>
                            ${func.nome} - ${func.cargo}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label for="usuarioId" class="form-label">Cliente (Usuário)</label>
            <select id="usuarioId" name="usuarioId" class="form-select" required>
                <option value="">Selecione o cliente</option>
                <c:forEach var="user" items="${usuarios}">
                    <option value="${user.id}"
                            <c:if test="${pedidoEditar != null && pedidoEditar.usuario != null && pedidoEditar.usuario.id == user.id}">
                                selected
                            </c:if>>
                         ${user.email}
                    </option>
                </c:forEach>
            </select>
        </div>

        <button type="submit" class="btn btn-success">
            ${pedidoEditar != null ? 'Salvar Alterações' : 'Cadastrar Pedido'}
        </button>
    </form>

    <c:if test="${not empty msg}">
        <div class="alert alert-info">${msg}</div>
    </c:if>

    <h2 class="mb-3">Lista de Pedidos</h2>
    <table>
        <thead>
        <tr>
            <th>Descrição</th>
            <th>Valor</th>
            <th>Tipo</th>
            <th>Funcionário</th>
            <th>Cliente</th>
            <th colspan="2">Ações</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="pedido" items="${pedidos}">
            <tr>
                <td>${pedido.descricao}</td>
                <td>R$ ${pedido.valor}</td>
                <td>${pedido.tipo_pedido}</td>
                <td>${pedido.funcionario != null ? pedido.funcionario.nome : 'N/A'}</td>
                <td>${pedido.usuario != null ? pedido.usuario.email : 'N/A'}</td>
                <td><a href="${pageContext.request.contextPath}/pedido?opcao=editar&&info=${pedido.codigo_pedido}" class="btn btn-sm btn-warning">Editar</a></td>
                <td><a href="${pageContext.request.contextPath}/pedido?opcao=excluir&&info=${pedido.codigo_pedido}" class="btn btn-sm btn-danger">Excluir</a></td>
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
