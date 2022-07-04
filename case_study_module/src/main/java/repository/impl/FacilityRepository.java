package repository.impl;

import dto.FacilityDto;
import model.facility.Facility;
import repository.IFacilityRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class FacilityRepository implements IFacilityRepository {
    private static List<FacilityDto> facilityDtoList = new ArrayList<>();
    private static final String FIND_ALL = " select s.service_id, s.service_name, s.service_area, s.service_cost, s.service_max_people, r.rent_type_name, st.service_type_name, s.standard_room, s.description_other_convenience, s.pool_area, s.number_of_floors, s.facility_free from service s " +
            " join rent_type r on s.rent_type_id = r.rent_type_id " +
            " join service_type st on s.service_type_id = st.service_type_id " +
            " order by s.service_id ";
    private static final String FIND_BY_ID = " select * from service where service_id = ? ";
    private static final String INSERT = " insert into service(service_name, service_area, service_cost, service_max_people, rent_type_id, service_type_id, standard_room, \n" +
            " description_other_convenience, pool_area, number_of_floors) " +
            " values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
    private static final String DELETE = " delete from service where service_id = ? ";
    private static final String UPDATE = " update service set service_name = ?, service_area = ?, service_cost = ?, service_max_people = ?, rent_type_id = ?, service_type_id = ?, standard_room = ?, " +
            " description_other_convenience = ?, pool_area = ?, number_of_floors = ? " +
            " where service_id = ? ";
    private static final String SEARCH = " select s.service_id, s.service_name, s.service_area, s.service_cost, s.service_max_people, r.rent_type_name, st.service_type_name, s.standard_room, s.description_other_convenience, s.pool_area, s.number_of_floors from service s " +
            " join rent_type r on s.rent_type_id = r.rent_type_id " +
            " join service_type st on s.service_type_id = st.service_type_id " +
            " where st.service_type_name = 'Villa' and s.service_name like ? " +
            " order by s.service_id ";

    @Override
    public List<FacilityDto> findAll() {
        facilityDtoList.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            FacilityDto facilityDto = null;
            while (resultSet.next()) {
                int serviceId = Integer.parseInt(resultSet.getString("service_id"));
                String serviceName = resultSet.getString("service_name");
                int serviceArea = Integer.parseInt(resultSet.getString("service_area"));
                double serviceCost = Double.parseDouble(resultSet.getString("service_cost"));
                int serviceMaxPeople = Integer.parseInt(resultSet.getString("service_max_people"));
                String rentTypeName = resultSet.getString("rent_type_name");
                String serviceTypeName = resultSet.getString("service_type_name");
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = Double.parseDouble(resultSet.getString("pool_area"));
                int numberOfFloors = Integer.parseInt(resultSet.getString("number_of_floors"));
                String facilityFree = resultSet.getString("facility_free");
                facilityDto = new FacilityDto(serviceId, serviceName, serviceArea, serviceCost, serviceMaxPeople, rentTypeName, serviceTypeName, standardRoom,
                        descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
                facilityDtoList.add(facilityDto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return facilityDtoList;
    }

    @Override
    public Facility findById(int id) {
        Connection connection = new BaseRepository().getConnection();
        Facility facility = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int serviceId = Integer.parseInt(resultSet.getString("service_id"));
                String serviceName = resultSet.getString("service_name");
                int serviceArea = Integer.parseInt(resultSet.getString("service_area"));
                double serviceCost = Double.parseDouble(resultSet.getString("service_cost"));
                int serviceMaxPeople = Integer.parseInt(resultSet.getString("service_max_people"));
                int rentTypeId = Integer.parseInt(resultSet.getString("rent_type_id"));
                int serviceTypeId = Integer.parseInt(resultSet.getString("service_type_id"));
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = Double.parseDouble(resultSet.getString("pool_area"));
                int numberOfFloors = Integer.parseInt(resultSet.getString("number_of_floors"));
                String facilityFree = resultSet.getString("facility_free");
                facility = new Facility(serviceId, serviceName, serviceArea, serviceCost, serviceMaxPeople, rentTypeId, serviceTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return facility;
    }

    @Override
    public void create(Facility facility) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, facility.getServiceName());
            preparedStatement.setInt(2, facility.getServiceArea());
            preparedStatement.setDouble(3, facility.getServiceCost());
            preparedStatement.setInt(4, facility.getServiceMaxPeople());
            preparedStatement.setInt(5, facility.getRentTypeId());
            preparedStatement.setInt(6, facility.getServiceTypeId());
            preparedStatement.setString(7, facility.getStandardRoom());
            preparedStatement.setString(8, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, facility.getPoolArea());
            preparedStatement.setInt(10, facility.getNumberOfFloors());

            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
            preparedStatement.setInt(1, id);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void update(int id, Facility facility) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
            preparedStatement.setString(1, facility.getServiceName());
            preparedStatement.setInt(2, facility.getServiceArea());
            preparedStatement.setDouble(3, facility.getServiceCost());
            preparedStatement.setInt(4, facility.getServiceMaxPeople());
            preparedStatement.setInt(5, facility.getRentTypeId());
            preparedStatement.setInt(6, facility.getServiceTypeId());
            preparedStatement.setString(7, facility.getStandardRoom());
            preparedStatement.setString(8, facility.getDescriptionOtherConvenience());
            preparedStatement.setDouble(9, facility.getPoolArea());
            preparedStatement.setInt(10, facility.getNumberOfFloors());
            preparedStatement.setInt(11, facility.getServiceId());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<FacilityDto> search(String name) {
        facilityDtoList.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH);
            preparedStatement.setString(1, "%" + name + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            FacilityDto facilityDto = null;
            while (resultSet.next()) {
                int serviceId = Integer.parseInt(resultSet.getString("service_id"));
                String serviceName = resultSet.getString("service_name");
                int serviceArea = Integer.parseInt(resultSet.getString("service_area"));
                double serviceCost = Double.parseDouble(resultSet.getString("service_cost"));
                int serviceMaxPeople = Integer.parseInt(resultSet.getString("service_max_people"));
                String rentTypeName = resultSet.getString("rent_type_name");
                String serviceTypeName = resultSet.getString("service_type_name");
                String standardRoom = resultSet.getString("standard_room");
                String descriptionOtherConvenience = resultSet.getString("description_other_convenience");
                double poolArea = Double.parseDouble(resultSet.getString("pool_area"));
                int numberOfFloors = Integer.parseInt(resultSet.getString("number_of_floors"));
                String facilityFree = resultSet.getString("facility_free");
                facilityDto = new FacilityDto(serviceId, serviceName, serviceArea, serviceCost, serviceMaxPeople, rentTypeName, serviceTypeName, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
                facilityDtoList.add(facilityDto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return facilityDtoList;
    }
}
