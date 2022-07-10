package dto;

public class StudentDto {
    private int studentId;
    private String studentName;
    private String studentBirthday;
    private String className;
    private String levelName;

    public StudentDto() {
    }

    public StudentDto(int studentId, String studentName, String studentBirthday, String className, String levelName) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.studentBirthday = studentBirthday;
        this.className = className;
        this.levelName = levelName;
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

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }

    public String getLevelName() {
        return levelName;
    }

    public void setLevelName(String levelName) {
        this.levelName = levelName;
    }
}
