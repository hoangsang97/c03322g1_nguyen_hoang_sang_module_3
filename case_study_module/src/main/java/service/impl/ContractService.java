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
    public Contract findById(int id) {
        return contractRepository.findById(id);
    }

    @Override
    public void create(Contract contract) {
        contractRepository.create(contract);
    }

    @Override
    public void createAttachContract(AttachService attachService) {
        contractRepository.createAttachContract(attachService);
    }

    @Override
    public void delete(int id) {
        contractRepository.delete(id);
    }

    @Override
    public void update(int id, Contract contract) {
        contractRepository.update(id, contract);
    }

    @Override
    public List<ContractDto> search(String name) {
        return contractRepository.search(name);
    }
}
