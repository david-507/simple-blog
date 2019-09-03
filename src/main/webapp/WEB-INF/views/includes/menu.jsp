<%@ page language="java" contentType="text/html; charset=UTF-8" session="true"%>
<nav class="my-2 my-md-0 mr-md-3">
    <a class="p-2 text-dark ${not empty param.inicio ? 'active' : '' }" href="/">Inicio</a>
    <a class="p-2 text-dark ${not empty param.autores ? 'active' : '' }" href="/authors">Autores</a>
</nav>
<a class="btn btn-outline-primary" href="/login">Iniciar sessión</a>