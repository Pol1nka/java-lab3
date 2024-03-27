package com.example.demo;

import java.io.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import service.FilesService;

@WebServlet("/files")
public class FilesServlet extends HttpServlet {

    @Override
    public void init() throws ServletException {
        super.init();
    }

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        FilesService filesService = new FilesService();

        String path = request.getParameter("path");
        File[] directories = filesService.getDirectories(path);
        if (directories == null) {
            directories = new File[0];
        }

        File[] files = filesService.getFiles(path);
        if (files == null) {
            files = new File[0];
        }

        request.setAttribute("directories", directories);
        request.setAttribute("files", files);

        var dispatcher = request.getRequestDispatcher("files.jsp");
        dispatcher.forward(request, response);
    }

    @Override
    public void destroy() {
        super.destroy();
    }
}