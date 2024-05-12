package sslove;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import z01_vo.Community;
import z01_vo.Report;

public class CommunityDao 
{
	public int insCommunity(Community comm) //커뮤니티 글 등록
	{
		int isInsert=0;
		String sql="INSERT INTO COMMUNITY \r\n"
				+ "values(community_seq.nextval,?,?,?,sysdate)";
		
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1, comm.getId_email());
			pstmt.setString(2, comm.getTitle());
			pstmt.setString(3, comm.getCcontent());
			
						
			isInsert=pstmt.executeUpdate();
			if(isInsert==0)
			{
				System.out.println("등록 실패");
				con.rollback();
			}
			else
			{
				con.commit(); 
				System.out.println("등록 성공");
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return isInsert;
	}
	
	
	
	
	public List<Community> getCommunitytListBySearch(Community sch) {
		List<Community> cList = new ArrayList<Community>();
		String sql ="SELECT COMMUNITYNO, c.ID_EMAIL, title, CCONTENT, WRITTENDATE, name FROM community c left join memberjsw m on c.id_email=m.id_email where title like? ORDER BY writtendate DESC";
				
			
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, "%" + sch.getTitle() + "%");
	

			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				while (rs.next()) {
//				
					cList.add(new Community(rs.getInt("communityno"), rs.getString("id_email"), rs.getString("title"),
							rs.getString("ccontent"), rs.getString("writtendate"), rs.getString("name")));
		
				}
				System.out.println("건수:" + cList.size());
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return cList;
	}
	
	
	public Community getCommunity(int communityno) {
		Community comm = null;
		String sql = "SELECT COMMUNITYNO, c.ID_EMAIL, title, CCONTENT, WRITTENDATE, name FROM community "
				+ "c left join memberjsw m on c.id_email=m.id_email WHERE communityno=? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setInt(1, communityno);
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				// mno name id pwd auth point
				if (rs.next()) {
					comm = new Community(rs.getInt("communityno"), rs.getString("id_email"), rs.getString("title"),
							rs.getString("ccontent"), rs.getString("writtendate"), rs.getString("name"));
				}
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return comm;
	}

	public int insReport(Report report) //신고 글 등록
	{
		int insCnt=0;
		String sql="INSERT INTO REPORT(reportno,victimid,offenderid,reportreason,reportdate,communityno) \r\n"
				+ "values(report_seq.nextval,?,?,?,sysdate,?)";
		
		try(Connection con=DBCon.con(); PreparedStatement pstmt=con.prepareStatement(sql);)
		{
			con.setAutoCommit(false);
			pstmt.setString(1, report.getVictimid());
			pstmt.setString(2, report.getOffenderid());
			pstmt.setString(3, report.getReportreason());
			pstmt.setInt(4, report.getCommunityno());
			
			insCnt=pstmt.executeUpdate();
			if(insCnt>0)
			{
				System.out.println("등록 성공");
				con.commit(); 
			}
			else
			{
				con.rollback();
				System.out.println("등록 실패");
			}
		}catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return insCnt;
	}
	
	
	public List<Report> getReportListBySearch(Report sch) {
		List<Report> rList = new ArrayList<Report>();
		String sql ="SELECT * FROM report where victimid like? ORDER BY reportdate asc";
				
			
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setString(1, "%" + sch.getVictimid() + "%");
	

			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				while (rs.next()) {
//				
					rList.add(new Report(rs.getInt("reportno"), rs.getString("victimid"), rs.getString("offenderid"),
							rs.getString("reportreason"), rs.getString("reportdate"), rs.getInt("communityno"), rs.getString("resolutionstatus"), rs.getString("handlingmethod")));
		
				}
				System.out.println("건수:" + rList.size());
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return rList;
	}
	
	public int updateReport(Report report) {
		int uptReport = 0;
		
		String sql = "update report\r\n" + " set handlingmethod = ?, resolutionstatus = ? where reportno =? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			con.setAutoCommit(false);
			// 처리코드1
			pstmt.setString(1, report.getHandlingmethod());
			System.out.println("오류:"+report.getHandlingmethod());
			System.out.println("오류:"+report.getResolutionstatus());
			System.out.println("오류:"+report.getReportno());
			pstmt.setString(2, report.getResolutionstatus());
			pstmt.setInt(3, report.getReportno());
			uptReport = pstmt.executeUpdate();
			if (uptReport == 0) {
				System.out.println("CUD 실패");
				con.rollback();
				System.out.println("cud실패2");
			} else {
				con.commit(); // Commit the transaction
				System.out.println("CUD 성공");
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}

		return uptReport;
	}
	
	
	public Report getReport(int reportno) {
		Report report = null;
		String sql = "SELECT * from report WHERE reportno=? ";
		try (Connection con = DBCon.con(); PreparedStatement pstmt = con.prepareStatement(sql);) {
			// 처리코드1
			pstmt.setInt(1, reportno);
			try (ResultSet rs = pstmt.executeQuery();) {
				// 처리코드2
				// mno name id pwd auth point
				if (rs.next()) {
					report = new Report(rs.getInt("reportno"), rs.getString("victimid"), rs.getString("offenderid"),
							rs.getString("reportreason"), rs.getString("reportdate"), rs.getInt("communityno"), rs.getString("resolutionstatus"), rs.getString("handlingmethod"));
				}
			}
		} catch (SQLException e) {
			System.out.println("DB 에러:" + e.getMessage());
		} catch (Exception e) {
			System.out.println("일반 에러:" + e.getMessage());
		}
		return report;
	}
	
	public static void main(String[] args) {
		CommunityDao dao = new CommunityDao(); 
		int isInsert = dao.insCommunity(new Community(1, "godlssl@naver.com", "오늘 밤 놀아요", "너무 심심해요", "2023-12-26"));
        System.out.println(isInsert > 0 ? "등록성공!!" : "등록실패");
    
		
		
	}

}
