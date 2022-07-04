package service;

import dto.ContractDto;
import model.contract.AttachService;
import model.contract.Contract;

import java.util.List;

public interface IContractService {
    List<ContractDto> findAll();

    Contract findById(int id);

    void create(Contract contract);

    void createAttachContract(AttachService attachService);

    void delete(int id);

    void update(int id, Contract contract);

    List<ContractDto> search(String name);
}
