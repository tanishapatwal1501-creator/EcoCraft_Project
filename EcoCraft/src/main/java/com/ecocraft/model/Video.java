package com.ecocraft.model;

public class Video {
    private int id;
    private String title;
    private String description;
    private String filename;
    private String uploader;
    private String uploadDate;
    private String category;
    
    public Video() {}
    
    public Video(int id, String title, String description, String filename, 
                 String uploader, String uploadDate, String category) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.filename = filename;
        this.uploader = uploader;
        this.uploadDate = uploadDate;
        this.category = category;
    }
    
    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }
    
    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public String getFilename() { return filename; }
    public void setFilename(String filename) { this.filename = filename; }
    
    public String getUploader() { return uploader; }
    public void setUploader(String uploader) { this.uploader = uploader; }
    
    public String getUploadDate() { return uploadDate; }
    public void setUploadDate(String uploadDate) { this.uploadDate = uploadDate; }
    
    public String getCategory() { return category; }
    public void setCategory(String category) { this.category = category; }
}