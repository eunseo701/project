package service;

import page.PageDAO;
import page.PageDAOImpl;
import page.PageGroupResult;

import page.PageRowResult;
import page.Pageinfo;

public class Pagemanager {

	private int requestPage;

	public Pagemanager(int requestPage) {
		this.requestPage = requestPage;
	}

	public Pagemanager() {
	}

	public PageRowResult getPageRowResult() {

		PageRowResult pageRowResult = new PageRowResult();
		// PageRowResult의 객체변수 값 세팅
		Pageinfo pageinfo = new Pageinfo();
		pageRowResult.setRowStartNumber(pageinfo.ROW_COUNT_PRE_PAGE * requestPage - (pageinfo.ROW_COUNT_PRE_PAGE - 1));
		pageRowResult.setRowEndNumber(pageinfo.ROW_COUNT_PRE_PAGE * requestPage);
		return pageRowResult;

	}

	public PageGroupResult getPageGroupResult(String sql) {
		PageGroupResult pageGroupResult = new PageGroupResult();
		Pageinfo pageinfo = new Pageinfo();
		int requestPageGroupNumber = ((requestPage-1)/Pageinfo.SHOW_PAGE_COUNT)+1;
		
		pageGroupResult.setGroupStartNumber(pageinfo.SHOW_PAGE_COUNT * requestPageGroupNumber - (pageinfo.SHOW_PAGE_COUNT - 1));
		pageGroupResult.setGroupEndNumber(pageinfo.SHOW_PAGE_COUNT * requestPageGroupNumber);
		
		PageDAO dao = new PageDAOImpl();
		int totalRow = dao.getCount(sql);
		
		int totalPageNumber = (int)Math.ceil((double)totalRow/pageinfo.ROW_COUNT_PRE_PAGE) ;
		
		if(pageGroupResult.getGroupEndNumber() > totalPageNumber) {
			pageGroupResult.setGroupEndNumber(totalPageNumber);
		}
		
		if(pageGroupResult.getGroupStartNumber() == 1) {
			pageGroupResult.setBeforePage(false);
		}
		
		if(pageGroupResult.getGroupEndNumber() == totalPageNumber) {
			pageGroupResult.setAfterPage(false);
		}
		
		pageGroupResult.setSelectPageNumber(requestPage);
		return pageGroupResult;
	}

}