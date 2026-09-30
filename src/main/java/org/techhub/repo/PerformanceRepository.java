package org.techhub.repo;

import java.util.List;
import org.techhub.model.Performance;

public interface PerformanceRepository {
	List<Performance> getAll();
	boolean update(Performance p);
	boolean delete(int id);
	Performance findById(int id);
	boolean save(Performance p);
	List<Performance> findByStudentName(String name);}