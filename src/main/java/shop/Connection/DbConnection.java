package shop.Connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnection {
	private final String serverName = "DUCTHINHPC";
	private final String dbName = "Shop2H2TWeb";
	private final String portNumber = "1433";
	private final String instance = "";
	private final String userID = "sa";
	private final String password = "chetzoitao11";
	 
	
	/*
	 * private final String serverName = "eu-az-sql-serv1.database.windows.net";
	 * private final String dbName = "dqugx0y7r1acpam"; private final String
	 * portNumber = "1433"; private final String instance = ""; private final String
	 * userID = "uvzn1v92wbzm9rk"; private final String password =
	 * "uLOZLd9zO5hG&s7Vf#@bysMCT";
	 */

	public Connection getConnection() throws Exception {
		String url = "jdbc:sqlserver://" + serverName + ":" + portNumber + "\\" + instance + ";databaseName="
				+ dbName;
		if (instance == null || instance.trim().isEmpty())
			url = "jdbc:sqlserver://" + serverName + ":" + portNumber + ";databaseName=" + dbName;
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		return DriverManager.getConnection(url, userID, password);
	}
	
	public static void main(String[] args) throws Exception {
		DbConnection conn = new DbConnection();
		System.out.println(conn.getConnection());
	}
}
