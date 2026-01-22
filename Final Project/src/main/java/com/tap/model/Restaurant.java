package com.tap.model;

public class Restaurant {

    private int restaurantId;
    private String restaurantName;
    private int adminId;
    private String address;
    private String cuisineType;
    private double rating;
    private int eta; // Estimated Time of Arrival (in minutes)
    private String imageUrl;
    private boolean isAvailable;

    // No-argument constructor
    public Restaurant() {
    }

    // Constructor without restaurantId (for insert operations)
    public Restaurant(String restaurantName, int adminId, String address,
                      String cuisineType, double rating, int eta,
                      String imageUrl, boolean isAvailable) {
        this.restaurantName = restaurantName;
        this.adminId = adminId;
        this.address = address;
        this.cuisineType = cuisineType;
        this.rating = rating;
        this.eta = eta;
        this.imageUrl = imageUrl;
        this.isAvailable = isAvailable;
    }

    // Constructor with restaurantId (for fetch/update operations)
    public Restaurant(int restaurantId, String restaurantName, int adminId,
                      String address, String cuisineType, double rating,
                      int eta, String imageUrl, boolean isAvailable) {
        this.restaurantId = restaurantId;
        this.restaurantName = restaurantName;
        this.adminId = adminId;
        this.address = address;
        this.cuisineType = cuisineType;
        this.rating = rating;
        this.eta = eta;
        this.imageUrl = imageUrl;
        this.isAvailable = isAvailable;
    }

    // Getters and Setters
    public int getRestaurantId() {
        return restaurantId;
    }

    public void setRestaurantId(int restaurantId) {
        this.restaurantId = restaurantId;
    }

    public String getRestaurantName() {
        return restaurantName;
    }

    public void setRestaurantName(String restaurantName) {
        this.restaurantName = restaurantName;
    }

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCuisineType() {
        return cuisineType;
    }

    public void setCuisineType(String cuisineType) {
        this.cuisineType = cuisineType;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public int getEta() {
        return eta;
    }

    public void setEta(int eta) {
        this.eta = eta;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public boolean isAvailable() {
        return isAvailable;
    }

    public void setAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

    @Override
    public String toString() {
        return "Restaurant [restaurantId=" + restaurantId +
               ", restaurantName=" + restaurantName +
               ", adminId=" + adminId +
               ", address=" + address +
               ", cuisineType=" + cuisineType +
               ", rating=" + rating +
               ", eta=" + eta +
               ", imageUrl=" + imageUrl +
               ", isAvailable=" + isAvailable + "]";
    }
}
