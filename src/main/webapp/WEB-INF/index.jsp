<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8"/>
    <title>Login - Frango Mania</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"/>

    <style>
        body {
            background-color: #121212;
            color: #f5f5f5;
            font-family: 'Segoe UI', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
        }

        .login-box {
            background-color: #1e1e1e;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(255, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }

        .login-box .logo img {
            max-width: 150px;
            margin-bottom: 20px;
            border-radius: 8px;
        }

        h2 {
            font-size: 28px;
            color: #ff4d4d;
            margin-bottom: 10px;
        }

        p {
            font-size: 16px;
            color: #ccc;
            margin-bottom: 25px;
        }

        .input-group-text {
            background-color: #b30000;
            color: white;
            border: none;
        }

        .form-control {
            background-color: #2a2a2a;
            color: #fff;
            border: 1px solid #444;
        }

        .form-control:focus {
            border-color: #ff4d4d;
            box-shadow: 0 0 0 0.2rem rgba(255, 77, 77, 0.25);
        }

        .btn-success {
            background-color: #b30000;
            border: none;
        }

        .btn-success:hover {
            background-color: #ff1a1a;
        }

        .alert-danger {
            margin-top: 20px;
            background-color: #661111;
            border: none;
            color: #fff;
        }
    </style>
</head>
<body>

<div class="login-box" role="main" aria-label="Área de login do sistema FrangoMania">
<%--    <div class="logo">--%>
<%--        <img src="${pageContext.request.contextPath}/src/main/webapp/img/icons8-galinha-48.png" alt="Logo FrangoMania"/>--%>
<%--    </div>--%>
    <h2>Bem-vindo</h2>
    <p>Por favor, insira seu e-mail e senha</p>

    <form action="${pageContext.request.contextPath}/login" method="post" novalidate>
        <div class="input-group mb-3">
            <span class="input-group-text" id="email-addon"><i class="fa fa-user"></i></span>
            <input type="email" class="form-control" name="email" placeholder="E-mail" aria-label="E-mail"
                   aria-describedby="email-addon" required/>
        </div>

        <div class="input-group mb-4">
            <span class="input-group-text" id="senha-addon"><i class="fa fa-lock"></i></span>
            <input type="password" class="form-control" name="senha" placeholder="Senha" aria-label="Senha"
                   aria-describedby="senha-addon" required/>
        </div>

        <button type="submit" class="btn btn-success btn-lg w-100" aria-label="Entrar no sistema">
            Entrar
        </button>
    </form>

    <c:if test="${not empty msg}">
        <div class="alert alert-danger" role="alert" aria-live="assertive" aria-atomic="true">
                ${msg}
        </div>
    </c:if>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
