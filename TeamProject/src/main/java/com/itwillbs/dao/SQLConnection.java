package com.itwillbs.dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SQLConnection {
	//1,2 단계 디비 연결 메서드  정의 => 필요로 할때 호출 사용
	public Connection getConnection() throws Exception {
		Context init = new InitialContext();
		DataSource ds=
				(DataSource)init.lookup("java:comp/env/jdbc/c1d2304t1");
		Connection con=ds.getConnection();
		return con;
	}

}
