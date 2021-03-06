package controller;

import dto.ContractDto;
import model.contract.AttachService;
import service.IContractService;
import service.impl.ContractService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "ContractServlet", urlPatterns = "/contract")
public class ContractServlet extends HttpServlet {
    private static IContractService contractService = new ContractService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "createAttachService":
                showCreateAttachService(request, response);
                break;
            case "createContractDetail":
                showCreateContractDetail(request, response);
                break;
            case "showAttachContract":
                showAttachContract(request, response);
                break;
            default:
                showListContract(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "createAttachService":
                createAttachService(request, response);
                break;
            case "createContractDetail":
                createContractDetail(request, response);
                break;
        }
    }

    private void showListContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<ContractDto> contractDtoList = contractService.findAll();
        request.setAttribute("contract", contractDtoList);
        request.getRequestDispatcher("/view/contract/list.jsp").forward(request, response);
    }

    private void showCreateAttachService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/contract/createAttachService.jsp").forward(request, response);
    }

    private void createAttachService(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        double cost = Double.parseDouble(request.getParameter("cost"));
        String unit = request.getParameter("unit");
        String status = request.getParameter("status");

        AttachService attachService = new AttachService(name, cost, unit, status);
        contractService.createAttachContract(attachService);
        response.sendRedirect("/contract");
    }

    private void showCreateContractDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AttachService> attachServiceList = contractService.findAllAttach();
        List<ContractDto> contractDtoList = contractService.findAll();
        request.setAttribute("attach", attachServiceList);
        request.setAttribute("contract", contractDtoList);
        request.getRequestDispatcher("/view/contract/createContractDetail.jsp").forward(request, response);
    }

    private void createContractDetail(HttpServletRequest request, HttpServletResponse response) {

    }

    private void showAttachContract(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("contractId"));
        List<ContractDto> contractDtoList = contractService.findAll();
        request.setAttribute("contract", contractDtoList);
        List<AttachService> attachServiceList = contractService.findAllAttachContract(id);
        request.setAttribute("attachService", attachServiceList);
        request.setAttribute("flag", 1);
        request.getRequestDispatcher("/view/contract/list.jsp").forward(request, response);
    }
}
