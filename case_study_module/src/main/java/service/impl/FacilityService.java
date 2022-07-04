package service.impl;

import dto.FacilityDto;
import model.facility.Facility;
import repository.IFacilityRepository;
import repository.impl.FacilityRepository;
import service.IFacilityService;

import java.util.List;

public class FacilityService implements IFacilityService {
    private static IFacilityRepository facilityRepository = new FacilityRepository();

    @Override
    public List<FacilityDto> findAll() {
        return facilityRepository.findAll();
    }

    @Override
    public Facility findById(int id) {
        return facilityRepository.findById(id);
    }

    @Override
    public void create(Facility Facility) {
        facilityRepository.create(Facility);
    }

    @Override
    public void delete(int id) {
        facilityRepository.delete(id);
    }

    @Override
    public void update(int id, Facility Facility) {
        facilityRepository.update(id, Facility);
    }

    @Override
    public List<FacilityDto> search(String name) {
        return facilityRepository.search(name);
    }
}
