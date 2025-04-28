package com.farmerbuddy.model;

import java.time.LocalDate;
import java.util.Date;

public class MarketPrice {
    private int id;
    private String cropName;
    private double marketPrice;
    private Date lastUpdated;

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getCropName() { return cropName; }
    public void setCropName(String cropName) { this.cropName = cropName; }

    public double getMarketPrice() { return marketPrice; }
    public void setMarketPrice(double marketPrice) { this.marketPrice = marketPrice; }

    public Date getLastUpdated() { return lastUpdated; }
    public void setLastUpdated(java.sql.Date lastUpdated2) { this.lastUpdated = lastUpdated; }
	public void setLastUpdated(LocalDate lastUpdated2) {
		// TODO Auto-generated method stub
		this.lastUpdated=lastUpdated;
	}
	public void setLastUpdated(String lastUpdated2) {
		// TODO Auto-generated method stub
		this.lastUpdated=lastUpdated;
	}
}
