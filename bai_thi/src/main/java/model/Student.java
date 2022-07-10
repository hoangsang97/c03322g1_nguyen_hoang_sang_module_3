package model;

public class Student {
    private int studentId;
    private String studentName;
    private String studentBirthday;
    private int classId;
    private int levelId;

    public Student() {
    }

    public Student(int studentId, String studentName, String studentBirthday, int classId, int levelId) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentBirthday = studentBirthday;
        this.classId = classId;
        this.levelId = levelId;
    }

    public Student(String studentName, String studentBirthday, int classId, int levelId) {
        this.studentName = studentName;
        this.studentBirthday = studentBirthday;
        this.classId = classId;
        this.levelId = levelId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public String getStudentBirthday() {
        return studentBirthday;
    }

    public void setStudentBirthday(String studentBirthday) {
        this.studentBirthday = studentBirthday;
    }

    public int getClassId() {
        return classId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public int getLevelId() {
        return levelId;
    }

    public void setLevelId(int levelId) {
        this.levelId = levelId;
    }
}
