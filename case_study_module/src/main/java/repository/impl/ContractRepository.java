package repository.impl;

import dto.ContractDto;
import model.contract.AttachService;
import repository.IContractRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    public static List<ContractDto> contractDtoList = new ArrayList<>();
    private static final String FIND_ALL_CONTRACT = "select c.contract_id, s.service_name, cm.customer_name, c.contract_start_date, c.contract_end_date, c.contract_deposit, ifnull(s.service_cost, 0) + ifnull((cd.quantily * a.attach_service_cost), 0) as contract_total_money from contract c " +
            " join service s on c.service_id = s.service_id " +
            " join customer cm on c.customer_id = cm.customer_id " +
            " left join contract_detail cd on c.contract_id = cd.contract_id " +
            " left join attach_service a on cd.attach_service_id = a.attach_service_id " +
            " group by s.service_name" +
            " order by c.contract_id ";
    private static final String INSERT = " insert into attach_service(attach_service_name, attach_service_cost, attach_service_unit, attach_service_status) " +
            "values (?, ?, ?, ?) ";
    private static final String FIND_ALL_ATTACH = " select attach_service_id, attach_service_name, attach_service_cost, attach_service_unit, attach_service_status from attach_service ";
    private static final String FIND_ALL_ATTACH_CONTRACT = "  select a.* from attach_service a " +
            " join contract_detail cd on a.attach_service_id = cd.attach_service_id where contract_id = ? ";

    @Override
    public List<ContractDto> findAll() {
        contractDtoList.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_CONTRACT);
            ResultSet resultSet = preparedStatement.executeQuery();
            ContractDto contractDto = null;
            while (resultSet.next()) {
                int contractId = resultSet.getInt("contract_id");
                String serviceName = resultSet.getString("service_name");
                String customerName = resultSet.getString("customer_name");
                String contractStartDate = resultSet.getString("contract_start_date");
                String contractEndDate = resultSet.getString("contract_end_date");
                double contractDeposit = resultSet.getDouble("contract_deposit");
                double contractTotalMoney = resultSet.getDouble("contract_total_money");
                contractDto = new ContractDto(contractId, serviceName, customerName, contractStartDate, contractEndDate, contractDeposit, contractTotalMoney);
                contractDtoList.add(contractDto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return contractDtoList;
    }

    @Override
    public List<AttachService> findAllAttach() {
        List<AttachService> attachServiceList = new ArrayList<>();

        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_ATTACH);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("attach_service_id");
                String name = resultSet.getString("attach_service_name");
                double cost = resultSet.getDouble("attach_service_cost");
                String unit = resultSet.getString("attach_service_unit");
                String status = resultSet.getString("attach_service_status");
                AttachService attachService = new AttachService(id, name, cost, unit, status);
                attachServiceList.add(attachService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return attachServiceList;
    }

    @Override
    public List<AttachService> findAllAttachContract(int id) {
        List<AttachService> attachServiceList = new ArrayList<>();

        try {
            Connection connection = new BaseRepository().getConnection();
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL_ATTACH_CONTRACT);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int idS = resultSet.getInt("attach_service_id");
                String name = resultSet.getString("attach_service_name");
                double cost = resultSet.getDouble("attach_service_cost");
                String unit = resultSet.getString("attach_service_unit");
                String status = resultSet.getString("attach_service_status");
                AttachService attachService = new AttachService(idS, name, cost, unit, status);
                attachServiceList.add(attachService);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return attachServiceList;
    }

    @Override
    public void createAttachContract(AttachService attachService) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, attachService.getAttachServiceName());
            preparedStatement.setDouble(2, attachService.getAttachServiceCost());
            preparedStatement.setString(3, attachService.getAttachServiceUnit());
            preparedStatement.setString(4, attachService.getAttachServiceStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public List<ContractDto> search(String name) {
        return null;
    }
}
