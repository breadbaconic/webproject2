package util;

import java.sql.*;
import java.util.ArrayList;

import javax.swing.plaf.basic.BasicInternalFrameTitlePane.SystemMenuBar;

import sun.nio.cs.ext.ISCII91;
import user.Letter;
import user.Person;

import com.sun.medialib.mlib.Image;
import com.sun.tools.doclets.formats.html.resources.standard;

/**
 * Handle all user affairs * 
 * 
 */
public class UserOperator {
	private static final String connectionString = "jdbc:mysql://localhost:3306/Project2?useUnicode=true&characterEncoding=utf8";
	private static final String dbUsername = "root"; 
	private static final String dbPassword = "111111";

	
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (Exception e) { // TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * Get all people in the database
	 * 
	 * @return a list contains all people * @throws SQLException
	 */
	public static Person getPeople(String identifier, boolean isId) throws SQLException {
		Person userPerson = null;
		String queryString = "";
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		ResultSet rs = null;
		String username = "", nickname = "", comefrom = "", imageString = "";
		int id = 1, friendsNumber = 0, weiboNumber = 0, listenerNumber = 0;
		try {
			if (isId) {
				queryString = "Select * FROM user WHERE uid='"
					+ identifier + "'";
			} else {
				queryString = "Select * FROM user WHERE username='"
						+ identifier + "'";
			}
			ps = c.prepareStatement(queryString); 
			rs = ps.executeQuery();
			rs.last();
			id = rs.getInt("uid");
			username = rs.getString("username");
			nickname = rs.getString("nickname");
			comefrom = rs.getString("comefrom");
			imageString = rs.getString("image");
			
			queryString = "Select * FROM listen WHERE uid='" + id + "'";
			ps = c.prepareStatement(queryString);
			rs = ps.executeQuery();
			rs.last();
			listenerNumber = rs.getRow();
			rs.close();
			ps.close();
			
			queryString = "Select * FROM listen WHERE f_uid='" + id + "'";
			ps = c.prepareStatement(queryString);
			rs = ps.executeQuery();
			rs.last();
			friendsNumber = rs.getRow();

			weiboNumber = 0;

			userPerson = new Person(id, username, nickname, comefrom,
					friendsNumber, weiboNumber, listenerNumber);
			userPerson.setImage(imageString);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
		return userPerson;
	}
	
	public static boolean isFriend(int f_uid, int uid) throws SQLException {
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String queryString = "Select * FROM listen WHERE f_uid='"
					+ f_uid + "' AND uid='" + uid + "'" ;
			ps = c.prepareStatement(queryString); 
			rs = ps.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
		return false;
	}
	
	public static void doFriend(String f_uid, String uid, boolean isAdd) throws SQLException {
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		
		String queryString = "";
		
		try {
			if (isAdd) {
				queryString = "Insert INTO listen (uid, f_uid) VALUES ('" + uid + "', '" + f_uid + "')";
			}  else {
				queryString = "DELETE FROM listen WHERE uid='" + uid + "' AND f_uid='" + f_uid + "'" ;
			}
			ps = c.prepareStatement(queryString); 
			ps.executeUpdate();
			
			if (isAdd) {
				queryString = "UPDATE user SET listenernum=listenernum+1 WHERE uid='" + uid + "'";
			} else {
				queryString = "UPDATE user SET listenernum=listenernum-1 WHERE uid='" + uid + "'";
			}
			ps = c.prepareStatement(queryString); 
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
	}
	
	public static ArrayList<Person> getNewComers() throws SQLException {
		ArrayList<Person> list = new ArrayList<Person>();
		
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String queryString = "Select * FROM user ORDER BY regTime Desc LIMIT 12" ;
			ps = c.prepareStatement(queryString); 
			rs = ps.executeQuery();
			while (rs.next()) {
				int uid = rs.getInt("uid");
				String nickname = rs.getString("nickname");
				String image = rs.getString("image");
				Person p = new Person(uid, nickname, image);
				list.add(p);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
		
		return list;
	}
	
	public static ArrayList<Person> getHot() throws SQLException {
		ArrayList<Person> list = new ArrayList<Person>();
		
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String queryString = "Select * FROM user ORDER BY listenernum Desc LIMIT 10" ;
			ps = c.prepareStatement(queryString); 
			rs = ps.executeQuery();
			while (rs.next()) {
				int uid = rs.getInt("uid");
				String nickname = rs.getString("nickname");
				int listenerNumber = rs.getInt("listenernum");
				String image = rs.getString("image"); 
				Person p = new Person(uid, nickname, listenerNumber, image);
				list.add(p);
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
		
		return list;
	}
	
	public static void storeUser(String username, String nickname, String password,
			String comefrom) throws SQLException {
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		try {
			// prepare the statement according to the SQL statement.
			String checkUsernameSQL = "INSERT INTO `user` (username, nickname, password, regtime, comefrom) VALUES ('"
					+ username
					+ "', '"
					+ nickname
					+ "', '"
					+ password
					+ "', now(), '"
					+ comefrom + "')";
			ps = c.prepareStatement(checkUsernameSQL); // Execute the Query
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Notice! Always close the connection after using.
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
	}

	public static boolean isExistName(String username) throws SQLException {
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			// prepare the statement according to the SQL statement.
			String checkUsernameSQL = "SELECT username FROM user WHERE username in ('"
					+ username + "')";
			ps = c.prepareStatement(checkUsernameSQL); // Execute the Query
			rs = ps.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Notice! Always close the connection after using.
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
		return true;
	}
	
	public static boolean check(String username, String password) throws SQLException {
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			// prepare the statement according to the SQL statement.
			String checkSQL = "SELECT * FROM user WHERE username='"
					+ username + "' and password='" + password + "'";
			ps = c.prepareStatement(checkSQL); // Execute the Query
			rs = ps.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Notice! Always close the connection after using.
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
		return false;
	}

	public static boolean sendLetter(String senderid, String receiverid,
			String title, String content, String sendernickname) throws SQLException {
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		try {
			// prepare the statement according to the SQL statement.
			String sendLetterSQL = "INSERT INTO `letter` (name, content, sendid, receiveid, sendernickname) VALUES ('"
					+ title
					+ "', '"
					+ content
					+ "', '"
					+ senderid
					+ "', '"
					+ receiverid
					+ "', '"
					+ sendernickname + "')";
			ps = c.prepareStatement(sendLetterSQL); // Execute the Query
			ps.executeUpdate();
			
		} catch (SQLException e) {
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
			return false;
		} finally {
			// Notice! Always close the connection after using.
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
		return true;
	}
	
	public static boolean hasUnreadLetter(int userid) throws SQLException {
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			// prepare the statement according to the SQL statement.
			String checkSQL = "SELECT * FROM letter WHERE isRead='0' AND receiveid='" + userid + "'";
			ps = c.prepareStatement(checkSQL); // Execute the Query
			rs = ps.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Notice! Always close the connection after using.
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
		return false;
	}
	
	public static ArrayList<Letter> getLetters(String receivername) throws SQLException {
		ArrayList<Letter> list = new ArrayList<Letter>();
		
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			String queryString = "Select * FROM letter, user WHERE user.uid=letter.receiveid AND username='" + receivername +"' ORDER BY ltime Desc LIMIT 10" ;
			ps = c.prepareStatement(queryString); 
			rs = ps.executeQuery();
			while (rs.next()) {
				String title = rs.getString("name");
				String content = rs.getString("content");
				String sendernickname = rs.getString("sendernickname");
				boolean isRead = rs.getBoolean("isRead");
				Letter letter = new Letter(title, content, sendernickname, isRead);
				list.add(letter);
			}
			while (list.size() < 10) {
				Letter letter = new Letter("", "", "", true);
				list.add(letter);
			}
			
			queryString = "UPDATE letter, user SET isRead=1 WHERE user.uid=letter.receiveid AND username='" + receivername +"'";
			ps = c.prepareStatement(queryString); 
			ps.executeUpdate();
			
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null) {
				rs.close();
			}
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
		
		return list;
	}
	
	public static void uploadImage(String username, String path) throws SQLException {
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		try {
			// prepare the statement according to the SQL statement.
			String sendLetterSQL = "UPDATE user SET image='" + path + "' WHERE username='" + username + "'";
			ps = c.prepareStatement(sendLetterSQL); // Execute the Query
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Notice! Always close the connection after using.
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
	}
	
	public static void sendBlog(String userid, String content) throws SQLException {
		Connection c = DriverManager.getConnection(connectionString,
				dbUsername, dbPassword);
		PreparedStatement ps = null;
		try {
			// prepare the statement according to the SQL statement.
			String sendLetterSQL = "INSERT INTO `blog` (uid, content) VALUES ('"
					+ userid
					+ "', '"
					+ content + "')";
			ps = c.prepareStatement(sendLetterSQL); // Execute the Query
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			// Notice! Always close the connection after using.
			if (ps != null) {
				ps.close();
			}
			if (c != null) {
				c.close();
			}
		}
	}
}