package dto;

public class TeacherDto {
    private int teacherId;
    private String teacherName;
    private String teacherIdCard;
    private String className;

    public TeacherDto() {
    }

    public TeacherDto(int teacherId, String teacherName, String teacherIdCard, String className) {
        this.teacherId = teacherId;
        this.teacherName = teacherName;
        this.teacherIdCard = teacherIdCard;
        this.className = className;
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

    public String getClassName() {
        return className;
    }

    public void setClassName(String className) {
        this.className = className;
    }
}
