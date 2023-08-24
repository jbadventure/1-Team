package com.itwillbs.dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SQLConnection {
	
	public Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds=
				(DataSource)init.lookup("java:comp/env/jdbc/c1d2304t1");
		Connection con=ds.getConnection();
		return con;
	}

}
