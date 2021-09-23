/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package modelo;
import java.awt.HeadlessException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.swing.table.DefaultTableModel;

/**
 *
 * @author Lenovo FX
 */
public class Producto {
    private String producto,descripcion;
    private int id,id_marca,existencia;
    private float precioCosto,precioVenta;
    Conexion cn;

    public Producto(){}
    public Producto(String producto, String descripcion, int id, int id_marca, int existencia, float precioCosto, float precioVenta) {
        this.producto = producto;
        this.descripcion = descripcion;
        this.id = id;
        this.id_marca = id_marca;
        this.existencia = existencia;
        this.precioCosto = precioCosto;
        this.precioVenta = precioVenta;
    }

    public String getProducto() {
        return producto;
    }

    public void setProducto(String producto) {
        this.producto = producto;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_marca() {
        return id_marca;
    }

    public void setId_marca(int id_marca) {
        this.id_marca = id_marca;
    }

    public int getExistencia() {
        return existencia;
    }

    public void setExistencia(int existencia) {
        this.existencia = existencia;
    }

    public float getPrecioCosto() {
        return precioCosto;
    }

    public void setPrecioCosto(float precioCosto) {
        this.precioCosto = precioCosto;
    }

    public float getPrecioVenta() {
        return precioVenta;
    }

    public void setPrecioVenta(float precioVenta) {
        this.precioVenta = precioVenta;
    }
    
    public DefaultTableModel leer(){
        DefaultTableModel tabla = new DefaultTableModel();
        
        try{
            cn = new Conexion();
            String query = "SELECT idProducto as id,producto,descripcion,precio_costo,precio_venta,existencias,marca,idMarca FROM productos inner join marcas USING(idMarca);";
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            String encabezado[] = {"id","Producto","Descripción","Precio-Costo","Precio-Venta","Existencias","Marca","idMarca"};
            tabla.setColumnIdentifiers(encabezado);
            
            String datos[] = new String[8];
            while(consulta.next()) {
                datos[0] = consulta.getString("id");
                datos[1] = consulta.getString("producto");
                datos[2] = consulta.getString("descripcion");
                datos[3] = consulta.getString("precio_costo");
                datos[4] = consulta.getString("precio_venta");
                datos[5] = consulta.getString("existencias");
                datos[6] = consulta.getString("marca");
                datos[7] = consulta.getString("idMarca");
                tabla.addRow(datos);
            }
            
            cn.cerrar_conexion();
            
        }catch(SQLException ex){
            System.out.println("Error" + ex.getMessage());
        }
        
        return tabla;
    }
    
    public int agregar() {
        int retorno = 0;
        
        try{
            PreparedStatement parametro;
            
            String query;
            cn = new Conexion();
            cn.abrir_conexion();
            query = "INSERT INTO productos(producto,descripcion,precio_costo,precio_venta,existencias,idMarca) VALUES(?,?,?,?,?,?);";
            parametro = (PreparedStatement) cn.conexionBD.prepareStatement(query);
            parametro.setString(1, getProducto());
            parametro.setString(2, getDescripcion());
            parametro.setFloat(3, getPrecioCosto());
            parametro.setFloat(4, getPrecioVenta());
            parametro.setInt(5, getExistencia());
            parametro.setInt(6, getId_marca());
            
            retorno = parametro.executeUpdate();
            cn.cerrar_conexion();
        
        }catch(HeadlessException | SQLException ex){
            System.out.println("Error" + ex.getMessage());
        }
        
        return retorno;
    }
}
