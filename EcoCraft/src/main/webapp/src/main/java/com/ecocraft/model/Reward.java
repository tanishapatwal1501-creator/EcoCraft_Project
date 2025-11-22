package com.ecocraft.model;

public class Reward {
    private int id;
    private int userId;
    private String type;
    private String message;
    private String date;
    private boolean claimed;
    
    public Reward() {}
    
    public Reward(int id, int userId, String type, String message, String date, boolean claimed) {
        this.id = id;
        this.userId = userId;
        this.type = type;
        this.message = message;
        this.date = date;
        this.claimed = claimed;
    }
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    
    public String getType() { return type; }
    public void setType(String type) { this.type = type; }
    
    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }
    
    public String getDate() { return date; }
    public void setDate(String date) { this.date = date; }
    
    public boolean isClaimed() { return claimed; }
    public void setClaimed(boolean claimed) { this.claimed = claimed; }
}