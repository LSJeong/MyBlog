package co.lsj.blog.study.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface StudyMapper {
	List<Map<String, Integer>> studyList();
	List<StudyVO> studySelectList(String course);
	int studyDelete(int no);
	int studyInsert(StudyVO vo);
}
