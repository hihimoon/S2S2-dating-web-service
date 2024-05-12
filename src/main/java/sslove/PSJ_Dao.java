package sslove;

import java.security.interfaces.RSAKey;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import z01_vo.MatchMember;
import z01_vo.Member_info;
import z01_vo.Member_opp;

public class PSJ_Dao 
{
	public int insMemInfo(Member_info mem) 
	{
		int insCnt=0;
		String sql="INSERT INTO MEMBER_INFO \r\n"
				+ "values(?,?,?,?,?,?,?,?,?,?,?)";
		
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1, mem.getId_email());
			pstmt.setString(2, mem.getGender());
			pstmt.setInt(3, mem.getAge());
			pstmt.setString(4, mem.getLoc());
			pstmt.setInt(5, mem.getHeight());
			pstmt.setString(6, mem.getEducation());
			pstmt.setString(7, mem.getJob());
			pstmt.setInt(8, mem.getSal());
			pstmt.setString(9, mem.getDrink());
			pstmt.setString(10, mem.getSmoke());
			pstmt.setString(11, mem.getMbti());
						
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
	public int insMemInfo2(Member_opp mem) 
	{
		int insCnt=0;
		String sql="INSERT INTO MEMBER_OPP \r\n"
				+ "values(?,?,?,?)";
		
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1, mem.getId_email());
			pstmt.setInt(2, mem.getAge_opp());
			pstmt.setInt(3, mem.getHeight_opp());
			pstmt.setInt(4, mem.getSal_opp());
		
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
	public Member_info getM1(String id_email) {
		Member_info mem = null;
		String sql="SELECT * FROM MEMBER_INFO WHERE id_email = ?";
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			pstmt.setString(1, id_email);	
			try(ResultSet rs=pstmt.executeQuery();)
			{
				while(rs.next()){
					mem = new Member_info(
							rs.getString("id_email"),
							rs.getString("gender"),
							rs.getInt("age"),
							rs.getString("loc"),
							rs.getInt("height"),
							rs.getString("education"),
							rs.getString("job"),
							rs.getInt("sal"),
							rs.getString("drink"),
							rs.getString("smoke"),
							rs.getString("mbti")
							);
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}				
		return mem;
	}
	
	
	
	public List<MatchMember> matchMem(Member_info m1, Member_opp m2){
		List<MatchMember> list = new ArrayList<MatchMember>();
		int age = m1.getAge();
		String gender = m1.getGender();
		String sql = "SELECT * FROM MEMBER_INFO\r\n";
		if (!gender.equals("A")) {
			sql += "WHERE GENDER = ? \r\n";
				}
		else {
			sql += "WHERE GENDER = 'F' OR GENDER = 'M' OR GENDER = ? \r\n";
		}
		if (m2.getAge_opp() > 0) {
			sql += "AND AGE > ?";
		}
		else if(m2.getAge_opp() < 0) {
			sql += "AND AGE < ?";
		}

		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			System.out.println("성별:" + m1.getGender());
			System.out.println("내나이:" + age);
			System.out.println("상대나이:" + m2.getAge_opp());
			if (gender.equals("F"))
				pstmt.setString(1, "M");
			else if(gender.equals("M")) {
				pstmt.setString(1, "F");
			}
			else {
				pstmt.setString(1, "A");
			}
				
			if (m2.getAge_opp() != 0) {
				pstmt.setInt(2, age-m2.getAge_opp());
			}
			else if (m2.getAge_opp() == 99) {
				pstmt.setInt(2, 0);
			}
			try(ResultSet rs=pstmt.executeQuery();)
			{
				while(rs.next()){
					list.add(new MatchMember(
							rs.getString("id_email"),
							rs.getString("gender"),
							rs.getInt("age"),
							rs.getInt("sal")
							));
				}
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}		
		return list;
	}
	
	
	public static void main(String[] args) 
	{
		
	}

}
