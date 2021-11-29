package co.lsj.blog.study.serviceImpl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import co.lsj.blog.study.service.StudyMapper;
import co.lsj.blog.study.service.StudyService;
import co.lsj.blog.study.service.StudyVO;

@Repository("studyDao")
public class StudyServiceImpl implements StudyService {
	@Autowired
	private StudyMapper map;
	
	@Override
	public List<StudyVO> studySelectList(String course){
		return map.studySelectList(course);
	}

	@Override
	public int studyDelete(int no) {
		return map.studyDelete(no);
	}

	@Override
	public int studyInsert(StudyVO vo) {
		return map.studyInsert(vo);
	}

	@Override
	public StudyVO studySelect(int no) {
		return map.studySelect(no);
	}

	@Override
	public int studyUpdate(StudyVO vo) {
		return map.studyUpdate(vo);
	}
	
	
}
