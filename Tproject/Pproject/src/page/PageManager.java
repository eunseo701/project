package page;

public class PageManager extends PageInfo {

	private int requestPage;

	public PageManager() {
		
		
	}
	
	
	public PageManager(int requestPage) {
		this.requestPage = requestPage;
	}
	
	public PageRowResult getPageRowResult() {
		PageRowResult pageRowResult = new PageRowResult();
		//PageRowResult의 객체변수 값 셋팅
		pageRowResult.setRowStartNumber(Row_Count_Pre_Page * (requestPage -1) +1);
		pageRowResult.setRowEndNumber(Row_Count_Pre_Page * requestPage);
		
		return pageRowResult;
	}
	
	public PageGroupResult getPageGroupResult(String sql) {
		PageGroupResult pageGroupResult = new PageGroupResult();
		PageRowResult pageRowResult = new PageRowResult();
		//PageGroupResult의 객체변수 값 셋팅
		
		//0부터 시작할때
		//int requestPageGroupNumber = (requestPage -1)/Show_Page_Count;
		//pageGroupResult.setGroupStartNumber(requestPageGroupNumber * Show_Page_Count +1);
		//pageGroupResult.setGroupEndNumber((requestPageGroupNumber+1) * Show_Page_Count);
		
		//1부터 시작할때
		int requestPageGroupNumber = (int)Math.ceil((double)requestPage/ Show_Page_Count);//올림
		pageGroupResult.setGroupStartNumber(requestPageGroupNumber * Show_Page_Count -(Show_Page_Count-1));
		pageGroupResult.setGroupEndNumber(requestPageGroupNumber * Show_Page_Count);
		//System.out.println(requestPageGroupNumber);
		
		//총 줄 수 가져오기
		PageDAO dao = new PageDAOImpl();
		int totalRow = dao.getCount(sql);
		
		//총 링크 개수
		int totalPageNumber = (int)Math.ceil((double)totalRow/Row_Count_Pre_Page);	
		//(totalRow-1)/Row_Count_Pre_Page+1; 내림
		
		//last페이지 링크값 변경하기
		if(pageGroupResult.getGroupEndNumber() > totalPageNumber) {
			pageGroupResult.setGroupEndNumber(totalPageNumber);
		}
	
		//before, after 유무
		if(pageGroupResult.getGroupStartNumber()==1) {
			pageGroupResult.setBeforPage(false);
		}
		if(pageGroupResult.getGroupEndNumber()==totalPageNumber) {
			pageGroupResult.setAfterPage(false);
		}
		
		pageGroupResult.setSelectPageNumger(requestPage);
		
		return pageGroupResult;
		
	}
	
/*	public static void main(String[] args) {
		PageManager p = new PageManager(0);
		//System.out.println(p.getPageRowResult().getRowStartNumber());
		//System.out.println(p.getPageRowResult().getRowEndNumber());
		
		System.out.println(p.getPageGroupResult().getGroupStartNumber());
		System.out.println(p.getPageGroupResult().getGroupEndNumber());
	}*/

}
