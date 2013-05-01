package helper;
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.JSONException;
import org.json.JSONObject;

public class MyDatabase {

    private static MyDatabase mSingleton = new MyDatabase();
    private String mDBHostname = "jdbc:mysql://localhost";
    private String mDBPort = "3306";
    private String mDBName = "progin_405_13510099";
    private String mDBUser = "root";
    private String mDBPass = "";
    private Connection mConn;
    private Statement mStatement;

    public static MyDatabase getSingleton() {
        if (mSingleton == null) {
            mSingleton = new MyDatabase();
        }
        return mSingleton;
    }

    private MyDatabase() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            //JSON FROM APPFOG
            String VCAP_SERVICES = java.lang.System.getenv("VCAP_SERVICES");
            JSONObject services_json = new JSONObject(VCAP_SERVICES);
            JSONObject mysql_config = services_json.getJSONArray("mysql-5.1").getJSONObject(0).getJSONObject("credentials");
            mDBUser = mysql_config.getString("username");
            mDBPass = mysql_config.getString("password");
            mDBHostname = mysql_config.getString("hostname");
            mDBPort = mysql_config.getString("port");
            mDBName = mysql_config.getString("name");


            mConn = DriverManager.getConnection("jdbc:mysql://" + mDBHostname + ":" + mDBPort + "/" + mDBName, mDBUser, mDBPass);
            mStatement = mConn.createStatement();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        } catch (JSONException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet selectDB(String pQuery) {
        ResultSet tReturn = null;
        try {
            tReturn = mStatement.executeQuery(pQuery);
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tReturn;
    }

    public int queryDB(String pQuery) {
        int tReturn = -1;
        try {
            tReturn = mStatement.executeUpdate(pQuery);
        } catch (SQLException ex) {
            Logger.getLogger(MyDatabase.class.getName()).log(Level.SEVERE, null, ex);
        }
        return tReturn;
    }
}