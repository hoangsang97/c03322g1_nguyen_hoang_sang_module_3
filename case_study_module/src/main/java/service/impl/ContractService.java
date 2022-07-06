package service.impl;

import dto.ContractDto;
import model.contract.AttachService;
import model.contract.Contract;
import repository.IContractRepository;
import repository.impl.ContractRepository;
import service.IContractService;

import java.util.List;

public class ContractService implements IContractService {
    private static IContractRepository contractRepository = new ContractRepository();
    @Override
    public List<ContractDto> findAll() {
        return contractRepository.findAll();
    }

    @Override
    public List<AttachService> findAllAttach() {
        return contractRepository.findAllAttach();
    }

    @Override
    public void createAttachContract(AttachService attachService) {
        contractRepository.createAttachContract(attachService);
    }

    @Override
    public List<ContractDto> search(String name) {
        return contractRepository.search(name);
    }

    @Override
    public List<AttachService> findAllAttachContract(int id) {
        return contractRepository.findAllAttachContract(id);
    }
}
