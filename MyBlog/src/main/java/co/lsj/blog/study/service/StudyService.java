package co.lsj.blog.study.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface StudyService {
	List<Map<String, Integer>> studyList();
	List<StudyVO> studySelectList(String course);
	StudyVO studySelect(int no);
	int studyInsert(StudyVO vo);
	int studyUpdate(StudyVO vo);
	int studyDelete(int no);
}
