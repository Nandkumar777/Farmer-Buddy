package com.farmerbuddy.dao;

import com.farmerbuddy.model.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {
    private Connection connection;

    // Constructor to initialize the database connection
    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    // Method to fetch all users from the database
    public List<User> getAllUsers() throws SQLException {
        List<User> userList = new ArrayList<>();
        String query = "SELECT * FROM users";  // Make sure your table name is 'users'
        
        try (PreparedStatement statement = connection.prepareStatement(query);
             ResultSet resultSet = statement.executeQuery()) {
            
            while (resultSet.next()) {
                User user = new User();
                user.setId(resultSet.getInt("user_id"));
                user.setUsername(resultSet.getString("name"));
                user.setEmail(resultSet.getString("email"));
                user.setRole(resultSet.getString("role"));
                userList.add(user);
            }
        }
        return userList;
    }

    // Method to fetch a user by ID
    public User getUserById(int userId) throws SQLException {
        User user = null;
        String query = "SELECT * FROM users WHERE id = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    user = new User();
                    user.setId(resultSet.getInt("id"));
                    user.setUsername(resultSet.getString("username"));
                    user.setEmail(resultSet.getString("email"));
                    user.setRole(resultSet.getString("role"));
                    user.setStatus(resultSet.getString("status"));
                }
            }
        }
        return user;
    }

    // Method to delete a user by ID
    public boolean deleteUser(int userId) throws SQLException {
        String query = "DELETE FROM users WHERE id = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setInt(1, userId);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        }
    }

    // Method to update a user's details
    public boolean updateUser(User user) throws SQLException {
        String query = "UPDATE users SET username = ?, email = ?, role = ?, status = ? WHERE id = ?";
        
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getRole());
            statement.setString(4, user.getStatus());
            statement.setInt(5, user.getId());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        }
    }

    // Method to add a new user
    public boolean addUser(User user) throws SQLException {
        String query = "INSERT INTO users (username, email, role, status) VALUES (?, ?, ?, ?)";
        
        try (PreparedStatement statement = connection.prepareStatement(query)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getEmail());
            statement.setString(3, user.getRole());
            statement.setString(4, user.getStatus());
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
        }
    }
}
