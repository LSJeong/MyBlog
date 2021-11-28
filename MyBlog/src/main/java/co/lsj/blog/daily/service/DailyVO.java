package co.lsj.blog.daily.service;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DailyVO {
	private String title;
	private String subject;
	private Date wdate;
	private int dailyno;
}
