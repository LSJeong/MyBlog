package co.lsj.blog.board.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter

public class BoardVO {
	private int no;
	private String title;
	private String subject;
	private String name;
	private String wdate;
	private String id;
}
