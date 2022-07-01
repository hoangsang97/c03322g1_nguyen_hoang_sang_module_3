package model.service;

public class Room extends Furama{
    private String freeServiceIncluded;

    public Room() {
    }

    public Room(String serviceName, double serviceArea, double serviceCost, int serviceMaxPeople, String rentTypeId, String freeServiceIncluded) {
        super(serviceName, serviceArea, serviceCost, serviceMaxPeople, rentTypeId);
        this.freeServiceIncluded = freeServiceIncluded;
    }

    public String getFreeServiceIncluded() {
        return freeServiceIncluded;
    }

    public void setFreeServiceIncluded(String freeServiceIncluded) {
        this.freeServiceIncluded = freeServiceIncluded;
    }
}
