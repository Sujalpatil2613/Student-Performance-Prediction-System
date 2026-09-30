	package org.techhub.services;
	
	import java.util.List;
	
	import org.springframework.beans.factory.annotation.Autowired;
	import org.springframework.stereotype.Service;
	import org.techhub.model.Performance;
	import org.techhub.repo.PerformanceRepository;
	
	
	@Service
	public class PerformanceServiceImpl implements PerformanceService {
	
	    @Autowired
	    private PerformanceRepository repo;
	
	    @Override
	    public void addPerformance(Performance p) {

	        // Convert 0–5 scale to percentage
	        double studyPercent = (p.getStudyHours() / 10.0) * 100;
	        double participationPercent = (p.getParticipation() / 10.0) * 100;

	        double predicted =
	                (0.3 * p.getAttendance()) +
	                (0.4 * p.getMarks()) +
	                (0.2 * studyPercent) +
	                (0.2 * participationPercent);

	        p.setPredictedPerformance(predicted);
	        repo.save(p);
	    }
	
	    @Override
	    public List<Performance> getAllPerformance() {

	        List<Performance> list = repo.getAll();

	        for(Performance p : list){

	            double score = p.getPredictedPerformance();

	            if(score >= 75){
	                p.setReadiness("Excellent");
	            }
	            else if(score >= 50){
	                p.setReadiness("Average");
	            }
	            else{
	                p.setReadiness("Poor");
	            }
	        }

	        return list;
	    }
	
	    @Override
	    public Performance getPerformanceById(int id) {
	        return repo.findById(id);
	    }
	
	    @Override
	    public void updatePerformance(Performance p) {

	        // Convert 0–5 scale to percentage
	        double studyPercent = (p.getStudyHours() / 10.0) * 100;
	        double participationPercent = (p.getParticipation() / 10.0) * 100;

	        double predicted =
	                (0.3 * p.getAttendance()) +
	                (0.4 * p.getMarks()) +
	                (0.2 * studyPercent) +
	                (0.2 * participationPercent);

	        p.setPredictedPerformance(predicted);
	        repo.update(p);
	    }
	
	    @Override
	    public boolean deletePerformance(int id) {
	        return repo.delete(id);
	    }
	    @Override
	    public List<Performance> getByStudentName(String name) {
	        return repo.findByStudentName(name);
	    }
	}