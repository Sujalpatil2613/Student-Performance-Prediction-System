package org.techhub.repo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.techhub.model.Performance;

@Repository
public class PerformanceRepositoryImpl implements PerformanceRepository {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public boolean save(Performance p) {
        String sql = "INSERT INTO performance(student_name, attendance, marks, study_hours, participation, predicted_performance) VALUES(?,?,?,?,?,?)";

        return jdbcTemplate.update(sql,
                p.getStudentName(),
                p.getAttendance(),
                p.getMarks(),
                p.getStudyHours(),
                p.getParticipation(),   // ✔ FIX
                p.getPredictedPerformance()
        ) > 0;
    }

    @Override
    public List<Performance> getAll() {
        String sql = "SELECT id, student_name AS studentName, attendance, marks, study_hours AS studyHours, participation, predicted_performance AS predictedPerformance FROM performance";
        
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Performance.class));
    }
    @Override
    public Performance findById(int id) {
        String sql = "SELECT id, student_name AS studentName, attendance, marks, study_hours AS studyHours, participation, predicted_performance AS predictedPerformance FROM performance WHERE id=?";
        
        return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Performance.class), id);
    }
    @Override
    public boolean update(Performance p) {
        String sql = "UPDATE performance SET student_name=?,attendance=?,marks=?,study_hours=?,participation=?,predicted_performance=? WHERE id=?";

        return jdbcTemplate.update(sql,
                p.getStudentName(),
                p.getAttendance(),
                p.getMarks(),
                p.getStudyHours(),
                p.getParticipation(),   // ✔ FIX
                p.getPredictedPerformance(),
                p.getId()
        ) > 0;
    }

    @Override
    public boolean delete(int id) {
        String sql = "DELETE FROM performance WHERE id=?";
        return jdbcTemplate.update(sql, id) > 0;
    }
//   
    
    @Override
    public List<Performance> findByStudentName(String name) {

        String sql = "SELECT id, student_name AS studentName, attendance, marks, study_hours AS studyHours, participation, predicted_performance AS predictedPerformance FROM performance WHERE LOWER(student_name)=LOWER(?)";

        return jdbcTemplate.query(sql,
                new BeanPropertyRowMapper<>(Performance.class),
                name);
    }
}