package sslove;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import z01_vo.Chat;
import z01_vo.ChatRooms;

/*
import="backendweb.d01_dao.PreparedStmtDao"
import="backendweb.z01_vo.*"
*/
public class Chat_Dao {

	public Object template(String dname) {
		Object ob = new Object();
		String sql = "select * from dept where dname like ?";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, "%" + dname + "%");
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				rs.next();
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return ob;
	}

	public int templateCUD(String ename) {
		int cudCnt = 0;
		String sql = "INSERT INTO emp01(ename) values(?)";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, ename);

			cudCnt = pstmt.executeUpdate();
			if (cudCnt == 0) {
				System.out.println("CUD 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("CUD 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return cudCnt;
	}
	
	//채팅입력(데이터 추가) 단, 데이터 수정 불가능
	public int insertChat(Chat ins)
	{
		int insCnt=0;
		String sql="INSERT INTO  S2S2CHAT \r\n"
				+ "values(?,?,?,?,?,sysdate)";
		
		try(Connection con = DBCon.con();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setInt(1,ins.getChatroom());
			pstmt.setInt(2,ins.getChatno());
			pstmt.setString(3,ins.getSendUserID());
			pstmt.setString(4,ins.getGetUserID());
			pstmt.setString(5,ins.getMessage());
			insCnt=pstmt.executeUpdate();
			if(insCnt>0)
			{
				//입력성공
				con.commit();
			}
			else
			{
				//입력실패
				con.rollback();
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		return insCnt;
	}
	
	public List<Chat> getChatList(Chat sch){
		List<Chat> chatList = new ArrayList<Chat>();
		String sql = "SELECT * FROM S2S2CHAT WHERE CHATROOM=? AND \r\n"
				   + "AND (SENDUSERID=? AND GETUSERID=?) OR (SENDUSERID=? AND GETUSERID=?) \r\n"
				   + "ORDER BY SENDTIME ASC";
		try( 
				  Connection con = DBCon.con();
				  PreparedStatement pstmt = con.prepareStatement(sql);
			){
					// 처리코드1
					pstmt.setInt(1, sch.getChatroom());
					pstmt.setString(2, sch.getSendUserID());
					pstmt.setString(3, sch.getGetUserID());
					
					try( 
							 ResultSet rs = pstmt.executeQuery();
							){
							// 처리코드2
							while(rs.next()) {
								chatList.add(new Chat(
											rs.getInt("chatroom"),
											rs.getString("sendUserID"),
											rs.getString("getUserID")
											));
							}
							System.out.println("건수:"+chatList.size());
						}	
					}catch(SQLException e) {
						System.out.println("DB 에러:"+e.getMessage());
					}catch(Exception e) {
						System.out.println("일반 에러:"+e.getMessage());
					}	
		
		return chatList;
	}
	
	public int deleteChat(int chatno) {
		int delCnt = 0;
		String sql = "DELETE FROM S2S2CHAT WHERE chatno=?";
		try (Connection con = DBCon.con(); 
			 PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setInt(1, chatno);
			delCnt = pstmt.executeUpdate();
			if (delCnt == 0) {
				System.out.println("삭제 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("삭제 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		return delCnt;
	}
	
	public int insertChatRooms(ChatRooms ins)
	{
		int insCnt=0;
		String sql="INSERT INTO  S2S2CHATROOMS \r\n"
				+ "values(chatrooms_seq.nextval,?,?)";
		
		try(Connection con = DBCon.con();
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1,ins.getSendUserID());
			pstmt.setString(2,ins.getGetUserID());
			insCnt=pstmt.executeUpdate();
			if(insCnt>0)
			{
				//입력성공
				con.commit();
			}
			else
			{
				//입력실패
				con.rollback();
			}
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		catch (Exception e) 
		{
			e.printStackTrace();
		} 
		return insCnt;
	}
	
	public List<ChatRooms> getChatRoomList(ChatRooms sch){
		List<ChatRooms> chatRoomList = new ArrayList<ChatRooms>();
		String sql = "SELECT m.NAME, ssc.*\r\n"
				+ "FROM S2S2CHATROOMS ssc\r\n"
				+ "JOIN MEMBERJSW m ON ssc.GETUSERID = m.ID_EMAIL\r\n"
				+ "WHERE m.NAME LIKE ?;";
		try( 
				  Connection con = DBCon.con();
				  PreparedStatement pstmt = con.prepareStatement(sql);
			){
					// 처리코드1
					pstmt.setString(1, "%"+sch.getName()+"%");
					
					try( 
							 ResultSet rs = pstmt.executeQuery();
							){
							// 처리코드2
							while(rs.next()) {
								chatRoomList.add(new ChatRooms(
											rs.getString("name"),
											rs.getInt("chatroom"),
											rs.getString("sendUserID"),
											rs.getString("getUserID")
											));
							}
							System.out.println("건수:"+chatRoomList.size());
						}	
					}catch(SQLException e) {
						System.out.println("DB 에러:"+e.getMessage());
					}catch(Exception e) {
						System.out.println("일반 에러:"+e.getMessage());
					}	
		
		return chatRoomList;
	}
	
	public int deleteChatRooms(int chatroom) {
		int delCnt = 0;
		String sql = "DELETE FROM S2S2CHATROOMS WHERE chatroom=?";
		try (Connection con = DBCon.con(); 
			 PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setInt(1, chatroom);
			delCnt = pstmt.executeUpdate();
			if (delCnt == 0) {
				System.out.println("삭제 실패");
				con.rollback();
			} else {
				con.commit(); // Commit the transaction
				System.out.println("삭제 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		return delCnt;
	}
	
	
//	public Chat getChat(int chatno) {
//		Member mem = new Member();
//		String sql = "SELECT * FROM MEMBERSS \r\n"
//				+ "WHERE MEMNO = ?";
//		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
//			// 처리코드1
//			pstmt.setInt(1, memno);
//			try (ResultSet rs = pstmt.executeQuery();) {
//				// 처리코드2
//				if (rs.next()) {
//					mem = new Member(
//							rs.getInt("MEMNO"),
//							rs.getString("PHONENUMBER"),
//							rs.getString("NICKNAME"),
//							rs.getString("PROFILE"),
//							rs.getString("LOCATION1"),
//							rs.getString("LOCATION2"),
//							rs.getInt("AUTH"),
//							rs.getString("GRADE")
//							);
//				}
//			}
//		} catch (SQLException e) {
//			System.out.println("DB 에러:" + e.getMessage());
//		} catch (Exception e) {
//			System.out.println("일반 에러:" + e.getMessage());
//		}		
//		return mem;
//	}
	
	
	
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		/*
		 * PreparedStmtDao dao = new PreparedStmtDao(); int insCnt =
		 * dao.insertProduct(new Product("운동기구", "제목입니다.", 3000, "제발 사주세요", "직거래",
		 * "강남구")); System.out.println(insCnt > 0 ? "등록성공!!" : "등록실패");
		 */
	}

}
