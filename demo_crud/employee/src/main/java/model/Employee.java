package model;

public class Employee {
    private int id;
    private String name;
    private String gender;
    private String level;

    public Employee() {
    }

    public Employee(int id, String name, String gender, String level) {
        this.id = id;
        this.name = name;
        this.gender = gender;
        this.level = level;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
