package kr.nclcorp.comm.vo;

import lombok.Data;

@Data
public class BoardVO extends SearchDefaultVO {
	private int idx;
	private String title;
	private String content;
	private String writer;
	private String regDate;
}
