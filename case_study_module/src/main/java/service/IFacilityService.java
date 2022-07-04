package service;

import dto.FacilityDto;
import model.facility.Facility;

import java.util.List;

public interface IFacilityService {
    List<FacilityDto> findAll();

    Facility findById(int id);

    void create(Facility facility);

    void delete(int id);

    void update(int id, Facility facility);

    List<FacilityDto> search(String name);
}
