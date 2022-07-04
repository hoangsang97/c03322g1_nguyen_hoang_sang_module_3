package repository.impl;

import dto.ContractDto;
import model.contract.AttachService;
import model.contract.Contract;
import repository.IContractRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepository implements IContractRepository {
    public static List<ContractDto> contractDtoList = new ArrayList<>();
    private static final String FIND_ALL = "select ct.contract_id, s.service_name, c.customer_name, ct.contract_start_date, ct.contract_end_date, ct.contract_deposit, ct.contract_total_money from contract ct " +
            " join service s on ct.service_id = s.service_id " +
            " join customer c on ct.customer_id = c.customer_id " +
            " order by ct.contract_id ";
    private static final String FIND_BY_ID = " select * from contract where contract_id = ? ";
    private static final String INSERT = " insert into attach_service(attach_service_name, attach_service_cost, attach_service_unit, attach_service_status) " +
            "values (?, ?, ?, ?) ";

    @Override
    public List<ContractDto> findAll() {
        contractDtoList.clear();
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = preparedStatement.executeQuery();
            ContractDto contractDto = null;
            while (resultSet.next()) {
                int contractId = resultSet.getInt("contract_id");
                String serviceName = resultSet.getString("service_name");
                String customerName = resultSet.getString("customer_name");
                String contractStartDate = resultSet.getString("contract_start_date");
                String contractEndDate = resultSet.getString("contract_end_date");
                double contractDeposit = Double.parseDouble(resultSet.getString("contract_deposit"));
                double contractTotalMoney = Double.parseDouble(resultSet.getString("contract_total_money"));
                contractDto = new ContractDto(contractId, serviceName, customerName, contractStartDate, contractEndDate, contractDeposit, contractTotalMoney);
                contractDtoList.add(contractDto);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return contractDtoList;
    }

    @Override
    public Contract findById(int id) {
        Connection connection = new BaseRepository().getConnection();
        Contract contract = null;
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_BY_ID);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int contractId = resultSet.getInt("contract_id");
                int serviceName = Integer.parseInt(resultSet.getString("service_name"));
                int customerName = Integer.parseInt(resultSet.getString("customer_name"));
                String contractStartDate = resultSet.getString("contract_start_date");
                String contractEndDate = resultSet.getString("contract_end_date");
                double contractDeposit = Double.parseDouble(resultSet.getString("contract_deposit"));
                double contractTotalMoney = Double.parseDouble(resultSet.getString("contract_total_money"));
                contract = new Contract(contractId, serviceName, customerName, contractStartDate, contractEndDate, contractDeposit, contractTotalMoney);
            }

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return contract;
    }

    @Override
    public void create(Contract contract) {
    }

    @Override
    public void createAttachContract(AttachService attachService) {
        Connection connection = new BaseRepository().getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
            preparedStatement.setString(1, attachService.getAttachServiceName());
            preparedStatement.setDouble(2, attachService.getAttachServiceCost());
            preparedStatement.setInt(3, attachService.getAttachServiceUnit());
            preparedStatement.setString(4, attachService.getAttachServiceStatus());
            preparedStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
    }

    @Override
    public void update(int id, Contract contract) {

    }

    @Override
    public List<ContractDto> search(String name) {
        return null;
    }
}
