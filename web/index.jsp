<%-- 
    Document   : index
    Created on : Nov 21, 2019, 9:11:40 PM
    Author     : Arthur Kyagulanyi
--%>
<%@page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Selecting Data From A Database</title>
    </head>
    <body>
        <h1>Selecting Data From A DB!</h1>
        <%!
            public class User {

                String URL = "jdbc:mysql://localhost:3306/traindatabase";
                String USERNAME = "root";
                String PASSWORD = "";

                Connection con = null;
                PreparedStatement selectUsers = null;
                ResultSet rs = null;

                public User() {
                    try {
                        con = DriverManager.getConnection(URL, USERNAME, PASSWORD);

                        selectUsers = con.prepareStatement("SELECT * FROM user");

                    } catch (SQLException e) {
                        System.out.println(e);
                    }
                }

                public ResultSet getUsers() {
                    try {
                        rs = selectUsers.executeQuery();
                    } catch (SQLException e) {
                        System.out.println(e);

                    }
                    return rs;
                }
            }
        %>
        <%
            User user = new User();
            ResultSet users = user.getUsers();

        %>
        <table border="2">

            <tbody>
                <tr>
                    <td>UserId</td>
                    <td>First Name</td>
                    <td>Last Name</td>
                    <td>User Name</td>
                    <td>Password</td>
                    <td>Telephone</td>
                    <td>Email</td>
                </tr>
                <% while (users.next()) {%>
                <tr>
                    <td><%= users.getInt("user_id")%> </td>
                    <td><%= users.getString("u_fname")%></td>
                    <td><%= users.getString("u_lname")%></td>
                    <td><%= users.getString("u_username")%></td>
                    <td><%= users.getString("u_password")%></td>
                    <td><%= users.getString("u_telephone")%></td>
                    <td><%= users.getString("u_email")%></td>

                </tr>
                <% }%>
            </tbody>
        </table>


    </body>
</html>
