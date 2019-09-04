<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark ${not empty param.inicio ? 'active' : '' }" href="/">Inicio</a>
    <a class="p-2 text-dark ${not empty param.inicio ? 'active' : '' }" href="/post">Escribir post</a>
    <a class="p-2 text-dark ${not empty param.autores ? 'active' : '' }" href="/authors">Autores</a>
</nav>

<div class="dropdown">
    <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        ${sessionScope.user.name}
    </button>
    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
        <a class="dropdown-item" href="#">Action</a>
        <a class="dropdown-item" href="#">Another action</a>
        <a class="dropdown-item" href="#">Something else here</a>
        <div class="dropdown-divider"></div>
        <a class="dropdown-item" href="/logout">Salir</a>
    </div>
</div>