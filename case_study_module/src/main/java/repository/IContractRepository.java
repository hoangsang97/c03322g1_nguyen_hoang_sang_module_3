package repository;

import dto.ContractDto;
import model.contract.AttachService;

import java.util.List;

public interface IContractRepository {
    List<ContractDto> findAll();

    List<AttachService> findAllAttach();

    List<AttachService> findAllAttachContract(int id);

    void createAttachContract(AttachService attachService);

    List<ContractDto> search(String name);
}
