<%-- 
    Document   : index
    Created on : 08-11-2016, 05:15:55 PM
    Author     : Carlos
--%>
<%@page import="com.sv.udb.controlador.AlumnosCtrl"%>
<%@page import="com.sv.udb.controlador.GruposCtrl"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Grupos-Alumnos</title>
        <jsp:include page="masterpages/head.jsp" />
    </head>
    <body>
        <jsp:include page="masterpages/menu.jsp" />
        <!--Content-->
        <div style="width: auto;">
            <br>
            <center>
                <div style="display: inline-block">
                    <h3 class="center-align">Grupos-Alumnos</h3>
                </div>
            </center>
            <br>
        </div>
        <section id="content">
            <div class="container">
                <form action="GruposALumnosServ" method="post" name="frm">
                    <div id="agregar" class="row">
                        <fieldset>
                            <legend >REGISTRO DE GRUPOS-ALUMNOS</legend>

                            <div class="row">
                                <div class="col s12">
                                    <div class="row s12">
                                        <label>&nbsp;&nbsp;&nbsp;&nbsp;(*) Campos obligatorios</label><br>
                                        <div class="row col offset-l2 l8 s12">
                                            <select name="cmbGrupos" class="browser-default">
                                                <jsp:useBean id="GruposCtrl" class="com.sv.udb.controlador.GruposCtrl" scope="page"/>
                                                <c:forEach items="${GruposCtrl.ConsTodo()}" var="fila">
                                                    <c:choose>
                                                        <c:when test="${fila.codiGrup eq cmbGrupos}">
                                                            <option name="codiGrup" value="${fila.codiGrup}" selected="">${fila.nombGrup}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option name="codiGrup" value="${ffila.codiGrup}">${fila.nombGrup}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="row col offset-l2 l8 s12">
                                            <select name="cmbAlumnos" class="browser-default">
                                                <jsp:useBean id="AlumnosCtrl" class="com.sv.udb.controlador.AlumnosCtrl" scope="page"/>
                                                <c:forEach items="${AlumnosCtrl.ConsTodo()}" var="fila">
                                                    <c:choose>
                                                        <c:when test="${fila.codiAlum eq cmbAlumnos}">
                                                            <option name="codiAlum" value="${fila.codiAlum}" selected="">${fila.nombAlum} ${fila.apelAlum}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option name="codiAlum" value="${fila.codiAlum}">${fila.nombAlum} ${fila.apelAlum}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </div>
                                        <div class="input-field col l6 s12">
                                            <input type="text" name="txtEsta" value="${txteesta}" placeholder="(*) Estado (1 = Activo, 0 = Inactivo)" MaxLength="1"/>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="col s12">
                                        <center>
                                            <button class="btn waves-effect waves-light light-blue darken-4" type="submit" name="accionBtn" value="Guardar">Guardar</button>
                                        </center>
                                    </div>
                                </div>
                        </fieldset>
                        <br>
                        <div class="col s12">
                            <fieldset>
                                <legend>LISTADO DE ALUMNOS</legend>
                                <!--jsp:useBean id="AlumnosCtrl" class="com.sv.udb.controlador.AlumnosCtrl" scope="page"/>-->
                                <table class="bordered striped responsive-table centered highlight">
                                    <thead>
                                        <tr>
                                            <th>Nombre</th>
                                            <th>Apellido</th>
                                            <th>Mail</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${AlumnosCtrl.ConsTodo()}" var="fila">
                                        <tr>
                                            <td><c:out value="${fila.nombAlum}"></c:out></td>
                                            <td><c:out value="${fila.apelAlum}"></c:out></td>
                                            <td><c:out value="${fila.mailAlum}"></c:out></td>
                                            <td>
                                                <center>
                                                    <p><input name="codiRadi" type="radio" id="test${fila.codiAlum}" value="${fila.codiAlum}"/><label for="test${fila.codiAlum}"></label></p>
                                                </center>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </fieldset>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <jsp:include page="masterpages/footer.jsp" />
    </body>
</html>