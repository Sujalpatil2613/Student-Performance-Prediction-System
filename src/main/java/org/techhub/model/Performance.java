package org.techhub.model;

public class Performance {

    private int id;
    private String studentName;
    private double attendance;
    private double marks;
    private double studyHours;
    private double participation;   // ✔ FIXED
    private double predictedPerformance;
    private String readiness;

    public String getReadiness() {
        return readiness;
    }

    public void setReadiness(String readiness) {
        this.readiness = readiness;
    }
    // getters & setters

    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getStudentName() { return studentName; }
    public void setStudentName(String studentName) { this.studentName = studentName; }

    public double getAttendance() { return attendance; }
    public void setAttendance(double attendance) { this.attendance = attendance; }

    public double getMarks() { return marks; }
    public void setMarks(double marks) { this.marks = marks; }

    public double getStudyHours() { return studyHours; }
    public void setStudyHours(double studyHours) { this.studyHours = studyHours; }

    public double getParticipation() { return participation; }   // ✔ FIX
    public void setParticipation(double participation) { this.participation = participation; }

    public double getPredictedPerformance() { return predictedPerformance; }
    public void setPredictedPerformance(double predictedPerformance) { this.predictedPerformance = predictedPerformance; }
}