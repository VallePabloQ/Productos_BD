<%-- 
    Document   : index
    Created on : 22/09/2021, 15:02:59
    Author     : Lenovo FX
--%>

<%@page import="modelo.Marca"%>
<%@page import="modelo.Producto"%>
<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-F3w7mX95PdgyTmZZMECAngseQB83DfGTowi0iMjiWaeVhAn4FJkqJByhZMI3AhiU" crossorigin="anonymous">
        <title>Ingreso de Productos</title>
    </head>
    <body>
        <h1 align="center">Ingreso de Productos</h1>
        <div class="container">
            <form action="sr_producto" method="post" class="form-group">
                <label for="lbl_producto"><b>Producto</b></label>
                <input type="text" name="txt_producto" id="txt_producto" class="form-control" placeholder="iPhone 12 pro">
                <label for="lbl_descripcion"><b>Descripción</b></label>
                <input type="text" name="txt_descripcion" id="txt_descripcion" class="form-control" placeholder="Escriba aquí...">
                <label for="lbl_costo"><b>Precio de Costo</b></label>
                <input type="text" name="txt_costo" id="txt_costo" class="form-control" placeholder="Ej: 350.50">
                <label for="lbl_venta"><b>Precio de Venta</b></label>
                <input type="text" name="txt_venta" id="txt_venta" class="form-control" placeholder="Ej: 1550.00">
                <label for="lbl_existencia"><b>Existencias</b></label>
                <input type="number" name="txt_existencia" id="txt_existencia" class="form-control" placeholder="Ej: 250">
                
                <label for="lbl_marcas"><b>Marca</b></label>
                <select name="drop_marca" id="drop_marca" class="form-select">
                    <%
                        Marca marca = new Marca();
                        HashMap<String,String> drop = marca.drop_sangre();
                        for (String i:drop.keySet()) {
                            out.println(" <option value='"+ i +"'>"+ drop.get(i) +"</option>");
                        }
                    %>
                </select>
                <br>
                <button name="btn_agregar" id="btn_agregar" class="btn btn-primary">Agregar</button>
            </form>
            <br>
            <table class="table table-hover table-dark">
                <thead>
                  <tr>
                      <th scope="col">#</th>
                    <th scope="col">Producto</th>
                    <th scope="col">Descripción</th>
                    <th scope="col">Precio-Costo</th>
                    <th scope="col">Precio-Venta</th>
                    <th scope="col">Existencia</th>
                    <th scope="col">Marca</th>
                  </tr>
                </thead>
                <tbody id="tbl_productos">
                    <%
                      Producto producto = new Producto();
                      DefaultTableModel tabla = new DefaultTableModel();
                      tabla = producto.leer();
                      for (int t = 0; t < tabla.getRowCount(); t++) {
                        out.println("<tr data-id=" + tabla.getValueAt(t, 0) + " data-idp=" + tabla.getValueAt(t, 7)+">");
                            out.println("<td>" + t + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 1) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 2) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 3) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 4) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 5) + "</td>");
                            out.println("<td>" + tabla.getValueAt(t, 6) + "</td>");
                        out.println("</tr>");
                      }
                    %>
                  
                </tbody>
            </table>
        </div>
    <script src="https://code.jquery.com/jquery-3.6.0.slim.js" integrity="sha256-HwWONEZrpuoh951cQD1ov2HUK5zA5DwJ1DNUXaM6FsY=" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-W8fXfP3gkOKtndU4JGtKDvXbO53Wy8SZCQHczT5FMiiqmQfUpWbYdTil/SxwZgAN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.min.js" integrity="sha384-skAcpIdS7UcVUC05LJ9Dxay8AXcDYfBJqt1CJ85S/CFujBsIzCIv+l9liuYLaMQ/" crossorigin="anonymous"></script>
    </body>
</html>
