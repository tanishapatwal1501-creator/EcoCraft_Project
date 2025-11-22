package com.ecocraft.model;

public class User {
    private int id;
    private String username;
    private String email;
    private String password;
    private String joinDate;
    
    public User() {}
    
    public User(int id, String username, String email, String password, String joinDate) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
        this.joinDate = joinDate;
    }
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    
    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }
    
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    
    public String getJoinDate() { return joinDate; }
    public void setJoinDate(String joinDate) { this.joinDate = joinDate; }
}