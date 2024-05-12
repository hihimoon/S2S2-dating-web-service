package sslove;

import java.sql.*;
import java.util.*;
import sslove.JSW_RegisterVO;

public class PreparedStmtDao 
{
	public SmallVOForShow getDetail(String id_email)
	{
		SmallVOForShow detail=null;
		String sql="SELECT name, phone, id_email\r\n"
				+ "FROM MemberJSW\r\n"
				+ "WHERE usernumber=1 AND id_email=?\r\n"
				+ "ORDER BY name";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			pstmt.setString(1,id_email);
			try(ResultSet rs=pstmt.executeQuery();)
			{
				if(rs.next())
				{
					detail=new SmallVOForShow(rs.getString("name"),rs.getString("phone"),rs.getString("id_email"));
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		return detail;
	}
	
	public List<SmallVOForShow> getMemberList()
	{
		List<SmallVOForShow> mlist=new ArrayList<SmallVOForShow>();
		String sql="SELECT name, phone, id_email\r\n"
				+ "FROM MemberJSW\r\n"
				+ "WHERE usernumber=1\r\n"
				+ "ORDER BY name";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			try(ResultSet rs=pstmt.executeQuery();)
			{
				while(rs.next())
				{
					mlist.add(new SmallVOForShow(rs.getString("name"),rs.getString("phone"),rs.getString("id_email")));
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return mlist;
	}
	
	
	public int insertRegister(JSW_RegisterVO insreg) //회원가입 정보 등록
	{
		int insCnt=0;
		String sql="INSERT INTO MemberJSW \r\n"
				+ "values(?,?,?,?,?,sysdate,sysdate,0,1)";
		
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1,insreg.getName());
			pstmt.setString(2,insreg.getResidentnum());
			pstmt.setString(3,insreg.getPhone());
			pstmt.setString(4,insreg.getId_email());
			pstmt.setString(5,insreg.getPwd());
			
			insCnt=pstmt.executeUpdate();
			if(insCnt>0)
			{
				con.commit();
			}
			else
			{
				con.rollback();
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return insCnt;
	}
	
	
	public int deleteRegister(JSW_RegisterVO delreg) //회원탈퇴
	{
		int delCnt=0;
		String sql="DELETE FROM MemberJSW\r\n"
				+ "WHERE name=? AND residentnum=? AND id_email=? AND pwd=?";
		
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1,delreg.getName());
			pstmt.setString(2,delreg.getResidentnum());
			pstmt.setString(3,delreg.getId_email());
			pstmt.setString(4,delreg.getPwd());
			
			delCnt=pstmt.executeUpdate();
			if(delCnt>0)
			{
				con.commit();
			}
			else
			{
				con.rollback();
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return delCnt;
	}
	
	
	public boolean duplicationCheck_id(String id)//매개변수로 전달한 아이디가 있으면 true리턴하고 없으면 false리턴한다.
	{
		boolean alreadyexisting=false;
		String sql="SELECT * FROM MemberJSW\r\n"
				+ "WHERE ID_EMAIL =?";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			pstmt.setString(1,id);
			try(ResultSet rs=pstmt.executeQuery();)
			{
				if(rs.next())
				{
					alreadyexisting=true;
				}
				else 
				{
					alreadyexisting=false;
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return alreadyexisting;
	}
	
	
	public boolean login(String id, String pwd)
	{
		boolean loginSuccess=false;
		String sql="SELECT * FROM MemberJSW js \r\n"
				+ "WHERE ID_EMAIL =? AND pwd=?";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			pstmt.setString(1,id);
			pstmt.setString(2,pwd);
			try(ResultSet rs=pstmt.executeQuery();)
			{
				if(rs.next())
				{
					loginSuccess=true;
				}
				else 
				{
					loginSuccess=false;
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		return loginSuccess;
	}
	
	
	public int setFinalLoginTime(String id)
	{
		int setfinallog=0;
		String sql="UPDATE MemberJSW\r\n"
				+ "SET FINALLOGINDATE =sysdate\r\n"
				+ "WHERE ID_EMAIL =?";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1,id);
			
			setfinallog=pstmt.executeUpdate();
			if(setfinallog>0)
			{
				con.commit();
			}
			else
			{
				con.rollback();
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return setfinallog;
	}
	
	public List<SmallVOForShow> showList()
	{
	
		List<SmallVOForShow> list=new ArrayList<SmallVOForShow>();
		String sql="SELECT name, phone, id_email\r\n"
				+ "FROM MemberJSW\r\n"
				+ "ORDER BY name";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			try(ResultSet rs=pstmt.executeQuery();)
			{
				while(rs.next())
				{
					list.add(new SmallVOForShow(rs.getString("name"),rs.getString("phone"), rs.getString("id_email")));
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return list;
	}
	
	public String chkName(String id) { //아이디를 기반으로 이름을 출력하는 메서드(from. 박성중)
		String name="";
		String sql="SELECT name FROM MemberJSW \r\n"
				+ "WHERE id_email = ?";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			pstmt.setString(1,id);
			try(ResultSet rs=pstmt.executeQuery();)
			{
				if(rs.next())
				{
					name = rs.getString(1);
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return name;
	}
	
	public int getHearts(String id)
	{
		int hearts=0;
		String sql="SELECT hearts\r\n"
				+ "FROM MEMBERJSW \r\n"
				+ "WHERE id_email=?";
		
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			pstmt.setString(1,id);
			try(ResultSet rs=pstmt.executeQuery();)
			{
				if(rs.next())
				{
					hearts = rs.getInt("hearts");
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return hearts;
	}
	
	public int insertBlockMember(String myid_email,String blockid_email)
	{
		int insCnt=0;
		String sql="INSERT INTO MYPAGE values(?,null,?)";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1,myid_email);
			pstmt.setString(2,blockid_email);

			insCnt=pstmt.executeUpdate();
			if(insCnt>0)
			{
				con.commit();
			}
			else
			{
				con.rollback();
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return insCnt;
	}
	
	
	public int insertFollowerMember(String myid_email,String followerid_email)
	{
		int insCnt=0;
		String sql="INSERT INTO MYPAGE values(?,?,null)";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1,myid_email);
			pstmt.setString(2,followerid_email);

			insCnt=pstmt.executeUpdate();
			if(insCnt>0)
			{
				con.commit();
			}
			else
			{
				con.rollback();
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return insCnt;
	}
	
	
	
	public List<String> getBlockList(String id)
	{
		List<String> blocklist=new ArrayList<String>();
		String sql="SELECT DISTINCT blockname \r\n"
				+ "FROM MYPAGE\r\n"
				+ "WHERE myid_email=?";
		
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			pstmt.setString(1,id);
			try(ResultSet rs=pstmt.executeQuery();)
			{
				while(rs.next())
				{
					String blockname=rs.getString("blockname");
					if(blockname!=null)
					{
						blocklist.add(blockname);
					}
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		return blocklist;
	}
	
	
	
	
	
	public List<String> getFollowerList(String id)
	{
		List<String> followerlist=new ArrayList<String>();
		String sql="SELECT DISTINCT followname \r\n"
				+ "FROM MYPAGE\r\n"
				+ "WHERE myid_email=?";
		
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			pstmt.setString(1,id);
			try(ResultSet rs=pstmt.executeQuery();)
			{
				while(rs.next())
				{
					String followname=rs.getString("followname");
					if(followname!=null)
					{
						followerlist.add(followname);
					}
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return followerlist;
	}
		
	
	public List<Bulletinboard> getBulletinBoardList(Bulletinboard bb) // 게시글 검색하기
	{	

		List<Bulletinboard>bblist=new ArrayList<Bulletinboard>();
		String sql="SELECT writer, title, writtentime \r\n"
				+ "FROM BULLETINBOARD\r\n"
				+ "WHERE writer LIKE ? AND title LIKE ?";
		
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			pstmt.setString(1,"%"+bb.getWriter()+"%");
			pstmt.setString(2,"%"+bb.getTitle()+"%");
			try(ResultSet rs=pstmt.executeQuery();)
			{
				while(rs.next())
				{
					bblist.add(new Bulletinboard(rs.getString("writer"),rs.getString("title"),rs.getTimestamp("writtentime")));
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return bblist;
	}
	
	
	
	
	
	
	
	
	
	
	public int writing(Bulletinboard bb) //게시글에 글 작성하기
	{
		int insCnt=0;
		String sql="INSERT INTO BULLETINBOARD values(?,?,sysdate,?)";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1,bb.getWriter());
			pstmt.setString(2,bb.getTitle());
			pstmt.setString(3,bb.getContent());
			
			insCnt=pstmt.executeUpdate();
			if(insCnt>0)
			{
				con.commit();
			}
			else
			{
				con.rollback();
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		
		return insCnt;
	}
	
	

	
	
	public static void main(String[] args) 
	{
		
	}

}
