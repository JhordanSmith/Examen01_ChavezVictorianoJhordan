package chavez.datos.impl;

import chavez.datos.PropiedadesDao;
import chavez.dominio.propiedades;
import java.util.List;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import chavez.database.Conexion;
import java.util.ArrayList;
import java.sql.SQLException;

public class PropiedadesDaoImpl implements PropiedadesDao<propiedades> {
	private final Conexion CON;
    private PreparedStatement ps;
    private ResultSet rs;
    
    public PropiedadesDaoImpl(){
        CON=Conexion.getInstancia();
    }
    
    @Override
    public List<propiedades> listar(String texto) {
        List<propiedades> lista = new ArrayList();
        try {
            ps=CON.conectar().prepareStatement("SELECT * FROM propiedades where nombre LIKE ?");
            ps.setString(1,"%"+texto+"%");
            rs=ps.executeQuery();
            while(rs.next()){
                lista.add(new propiedades(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getFloat(6)));
            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ps=null;
            CON.desconectar();
        }
        return lista;
    }

    @Override
    public boolean insertar(propiedades obj) {
        boolean resp=false;
        try {
            ps = CON.conectar().prepareStatement("INSERT INTO propiedades (nombre,direccion,caracteristicas,estado,precioalquiler) VALUES (?)");
            ps.setString(1, obj.getNombre());
            ps.setString(2, obj.getDireccion());
            ps.setString(3, obj.getCaracteristicas());
            ps.setString(4, obj.getEstado());
            ps.setFloat(5, obj.getPrecioalquiler());

            if (ps.executeUpdate() > 0) {
                resp = true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            ps = null;
            CON.desconectar();
        }
        return resp;
    }

    @Override
    public boolean actualizar(propiedades obj) {
        boolean resp=false;
        try {
            ps = CON.conectar().prepareStatement("UPDATE propiedades set nombre=?, direccion=?, caracteristicas=?,estado=?, precioalquiler=? WHERE id=?");
            ps.setString(1, obj.getNombre());
            ps.setString(2, obj.getDireccion());
            ps.setString(3, obj.getCaracteristicas());
            ps.setString(4, obj.getEstado());
            ps.setFloat(5, obj.getPrecioalquiler());
            if (ps.executeUpdate() > 0) {
                resp = true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            ps = null;
            CON.desconectar();
        }
        return resp;
    }

    @Override
    public boolean eliminar(int id) {
        boolean resp=false;
        try {
            ps = CON.conectar().prepareStatement("DELETE FROM propiedades WHERE id=?");
            ps.setInt(1, id);
            if (ps.executeUpdate() > 0) {
                resp = true;
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            ps = null;
            CON.desconectar();
        }
        return resp;
    }

    public static void main(String[] args) {
    	PropiedadesDaoImpl datos=new PropiedadesDaoImpl();
    	propiedades propiedad=new propiedades();
    	propiedad.setNombre("Prod JSP 2");
    	System.out.println(datos.insertar(propiedad));
    	
    }

	@Override
	public propiedades obtener(int id) {
		propiedades reg=new propiedades();
        try {
            ps=CON.conectar().prepareStatement("SELECT * FROM propiedades where id=?");
            ps.setInt(1,id);
            rs=ps.executeQuery();
            while(rs.next()){
                reg.setId(rs.getInt(1));
                reg.setNombre(rs.getString(2));
                reg.setDireccion(rs.getString(3));
                reg.setCaracteristicas(rs.getString(4));
                reg.setEstado(rs.getString(5));
                reg.setPrecioalquiler(rs.getFloat(6));

            }
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } finally {
            ps=null;
            CON.desconectar();
        }
        return reg;
	}


}
