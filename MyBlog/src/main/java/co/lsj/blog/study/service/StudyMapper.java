package co.lsj.blog.study.service;

import java.util.List;
import java.util.Map;

public interface StudyMapper {
	List<StudyVO> studySelectList(String course);
	StudyVO studySelect(int vo);
	int studyDelete(int no);
	int studyUpdate(StudyVO vo);
	int studyInsert(StudyVO vo);
}
