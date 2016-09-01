<%-- 
    Document   : index
    Created on : 08-11-2016, 05:15:55 PM
    Author     : Carlos
--%>
<%@page import="com.sv.udb.controlador.AlumnosCtrl"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <title>Alumnos</title>
        <jsp:include page="masterpages/head.jsp" />
    </head>
    <body>
        <jsp:include page="masterpages/menu.jsp" />
        <!--Content-->
        <div style="width: auto;">
            <br>
            <center>
                <div style="display: inline-block">
                    <h3 class="center-align">Alumnos</h3>
                </div>
            </center>
            <br>
        </div>
        <section id="content">
            <div class="container">
                <form action="AlumnosServ" method="post" name="frm">
                    <div id="agregar" class="row">
                        <fieldset>
                            <legend >REGISTRO DE ALUMNOS</legend>

                            <div class="row">
                                <div class="col s12">
                                    <div class="row s12">
                                        <label>&nbsp;&nbsp;&nbsp;&nbsp;(*) Campos obligatorios</label><br>
                                        <input type="hidden" name="codi" value="${codi}"/>
                                        <div class="input-field col l6 s12">
                                            <input type="text" name="txtNomb" value="${txtNomb}" placeholder="(*) Nombre" MaxLength="255"/>
                                        </div>
                                        <div class="input-field col l6 s12">
                                            <input type="text" name="txtApel" value="${txtApel}" placeholder="(*) Apellido" MaxLength="255"/>
                                        </div>
                                        <div class="input-field col l6 s12">
                                            <input type="text" name="txtFech" value="${txtFech}" placeholder="(*) Fecha de nacimiento (eg. 1990-01-01)" MaxLength="255"/>
                                        </div>
                                        <div class="input-field col l6 s12">
                                            <input type="text" name="txtMail" value="${txtMail}" placeholder="(*) E-Mail" MaxLength="255"/>
                                        </div>
                                        <div class="input-field col l6 s12">
                                            <input type="text" name="txtTele" value="${txtTele}" placeholder="(*) Teléfono" MaxLength="255"/>
                                        </div>
                                        <div class="input-field col l6 s12">
                                            <input type="text" name="txtDire" value="${txtDire}" placeholder="(*) Dirección" MaxLength="255"/>
                                        </div>
                                        <div class="input-field col l6 s12">
                                            <input type="text" name="txtGene" value="${txtGene}" placeholder="(*) Género (M = Masculino, F = Femenino)" MaxLength="1"/>
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
                                <jsp:useBean id="AlumnosCtrl" class="com.sv.udb.controlador.AlumnosCtrl" scope="page"/>
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