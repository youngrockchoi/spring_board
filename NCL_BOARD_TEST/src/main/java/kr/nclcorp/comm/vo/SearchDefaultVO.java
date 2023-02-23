package kr.nclcorp.comm.vo;

import lombok.Data;

/**
 * @Class Name : SearchDefaultVO.java
 * @Description : SearchDefaultVO Class
 * @Modification Information
 * @
 * @  수정일      수정자              수정내용
 * @ ---------   ---------   -------------------------------
 * @ 2016.06.28           최초생성
 *
 *  Copyright (C) by MOPAS All right reserved.
 */
@Data
public class SearchDefaultVO {

	/** 검색조건 */
	private String searchCondition = "";

	/** 검색Keyword */
	private String searchKeyword = "";

	/** 검색사용여부 */
	private String searchUseYn = "";

	/** 현재페이지 */
	private int pageIndex = 1;

	/** 페이지갯수 */
	private int pageUnit = 10;

	/** 페이지사이즈 */
	private int pageSize = 10;

	/** firstIndex */
	private int firstIndex = 0;

	/** lastIndex */
	private int lastIndex = 1;

	/** recordCountPerPage */
	private int recordCountPerPage = 10;

	
	private int curPage = 1;
	
	
}
