 package org.techhub.services;

import java.util.List;
import org.techhub.model.Performance;

public interface PerformanceService {

    void addPerformance(Performance p);

    List<Performance> getAllPerformance();

    boolean deletePerformance(int id) ;

    void updatePerformance(Performance p);

	Performance getPerformanceById(int id);
    List<Performance> getByStudentName(String name);
}