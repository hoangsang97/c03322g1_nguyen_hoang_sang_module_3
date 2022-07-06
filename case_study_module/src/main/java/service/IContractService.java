package service;

import dto.ContractDto;
import model.contract.AttachService;

import java.util.List;

public interface IContractService {
    List<ContractDto> findAll();

    List<AttachService> findAllAttach();

    void createAttachContract(AttachService attachService);

    List<ContractDto> search(String name);

    List<AttachService> findAllAttachContract(int id);
}
