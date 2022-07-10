package model;

public class Teacher {
    private int teacherId;
    private String teacherName;
    private String teacherIdCard;
    private int classId;

    public Teacher() {
    }

    public Teacher(int teacherId, String teacherName, String teacherIdCard, int classId) {
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.teacherIdCard = teacherIdCard;
        this.classId = classId;
    }

    public Teacher(String teacherName, String teacherIdCard, int classId) {
        this.teacherName = teacherName;
        this.teacherIdCard = teacherIdCard;
        this.classId = classId;
    }

    public int getTeacherId() {
        return teacherId;
    }

    public void setTeacherId(int teacherId) {
        this.teacherId = teacherId;
    }

    public String getTeacherName() {
        return teacherName;
    }

    public void setTeacherName(String teacherName) {
        this.teacherName = teacherName;
    }

    public String getTeacherIdCard() {
        return teacherIdCard;
    }

    public void setTeacherIdCard(String teacherIdCard) {
        this.teacherIdCard = teacherIdCard;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }
}
