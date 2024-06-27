package com.udi;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@SuppressWarnings("unused")
@WebServlet("/AddMaterialServlet")
@MultipartConfig
public class AddMaterialServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int classId = Integer.parseInt(request.getParameter("class_id"));
        int subjectId = Integer.parseInt(request.getParameter("subject_id"));
        Part filePart = request.getPart("material");
        String description = request.getParameter("description");

        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        String filePath = "uploads/" + fileName;

        try (InputStream fileContent = filePart.getInputStream()) {
            File uploads = new File("uploads");
            if (!uploads.exists()) {
                uploads.mkdir();
            }
            Files.copy(fileContent, new File(uploads, fileName).toPath());

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/school_management", "root", "mysql");

            PreparedStatement ps = con.prepareStatement(
                "INSERT INTO materials (class_id, subject_id, file_path, description) VALUES (?, ?, ?, ?)");
            ps.setInt(1, classId);
            ps.setInt(2, subjectId);
            ps.setString(3, filePath);
            ps.setString(4, description);
            ps.executeUpdate();

            response.sendRedirect("manage_materials.jsp?success=1");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("manage_materials.jsp?error=1");
        }
    }
}
