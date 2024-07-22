package util;

import java.sql.*;
public class JDBCUtil {
    public static Connection getConnection() throws Exception {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String dbPath = "jdbc:sqlite:/Users/qiaole/Desktop/hikvision/personal/2024/git/DreamRich/worm/helloDB.db";
        return DriverManager.getConnection(dbPath);
    }

    /**
     * 2、释放资源
     * @param resultSet resultSet
     * @param statement statement
     * @param connection connection
     */
    public static void release(ResultSet resultSet, Statement statement, Connection connection) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

}
