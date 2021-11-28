package co.lsj.blog.study.service;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class StudyVO {
	private String course;
	private String title;
	private String subject;
	private String code;
	private Date wdate;
	private int studyno;
}
