package com.codegym.repository;

import com.codegym.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserRepository {
    public void insertUser(User user) throws SQLException;

    public User selectUser(int id);

    public List<User> selectAllUsers();

    public boolean deleteUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    List<User> searchUser(String country);

    User getUserById(int id);

    void insertUserStore(User user) throws SQLException;

    void addUserTransaction(User user, int[] permisions);

    public void insertUpdateWithoutTransaction();
}

