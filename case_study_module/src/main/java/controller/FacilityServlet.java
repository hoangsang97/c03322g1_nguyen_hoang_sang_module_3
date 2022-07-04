package controller;

import dto.FacilityDto;
import model.facility.Facility;
import model.facility.Villa;
import service.IFacilityService;
import service.impl.FacilityService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "FacilityServlet", urlPatterns = "/facility")
public class FacilityServlet extends HttpServlet {
    private static IFacilityService facilityService = new FacilityService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        switch (action) {
            case "create":
                showCreateFacility(request, response);
                break;
            case "edit":
                showUpdateFacility(request, response);
                break;
            case "delete":
                deleteFacility(request, response);
                break;
            case "search":
                searchFacility(request, response);
                break;
            default:
                showListFacility(request, response);
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
            case "create":
                createFacility(request, response);
                break;
            case "edit":
                updateFacility(request, response);
                break;
        }
    }

    private void showListFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<FacilityDto> facilityDtoList = facilityService.findAll();
        request.setAttribute("facility", facilityDtoList);
        request.getRequestDispatcher("/view/facility/list.jsp").forward(request, response);
    }

    private void showCreateFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/view/facility/create.jsp").forward(request, response);
    }

    private void createFacility(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int renTypeId = Integer.parseInt(request.getParameter("renTypeId"));
        int serviceTypeId = 1;
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");

        Facility facility = new Facility(name, area, cost, maxPeople, renTypeId, serviceTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        facilityService.create(facility);
        response.sendRedirect("/facility");
    }

    private void showUpdateFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id  = Integer.parseInt(request.getParameter("id"));
        Facility facility = facilityService.findById(id);
        request.setAttribute("facility", facility);
        request.getRequestDispatcher("/view/facility/edit.jsp").forward(request, response);
    }

    private void updateFacility(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        int area = Integer.parseInt(request.getParameter("area"));
        double cost = Double.parseDouble(request.getParameter("cost"));
        int maxPeople = Integer.parseInt(request.getParameter("maxPeople"));
        int renTypeId = Integer.parseInt(request.getParameter("renTypeId"));
        int serviceTypeId = 1;
        String standardRoom = request.getParameter("standardRoom");
        String descriptionOtherConvenience = request.getParameter("descriptionOtherConvenience");
        double poolArea = Double.parseDouble(request.getParameter("poolArea"));
        int numberOfFloors = Integer.parseInt(request.getParameter("numberOfFloors"));
        String facilityFree = request.getParameter("facilityFree");

        Facility facility = new Facility(id, name, area, cost, maxPeople, renTypeId, serviceTypeId, standardRoom, descriptionOtherConvenience, poolArea, numberOfFloors, facilityFree);
        facilityService.update(id, facility);
        response.sendRedirect("/facility");
    }

    private void deleteFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        facilityService.delete(id);
        response.sendRedirect("/facility");
    }

    private void searchFacility(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nameSearch = request.getParameter("nameSearch");
        List<FacilityDto> facilityDtoList = facilityService.search(nameSearch);
        request.setAttribute("facility", facilityDtoList);
        request.getRequestDispatcher("/view/facility/list.jsp").forward(request, response);
    }
}
