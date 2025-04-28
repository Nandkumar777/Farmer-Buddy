package com.farmerbuddy.dao;

import com.farmerbuddy.model.MarketPrice;
import com.farmerbuddy.utils.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MarketPriceDAO {

    // 1. Get all market prices
    public List<MarketPrice> getAllPrices() {
        List<MarketPrice> prices = new ArrayList<>();

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement("SELECT * FROM market_prices ORDER BY crop_name")) {

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                MarketPrice mp = new MarketPrice();
                mp.setId(rs.getInt("id"));
                mp.setCropName(rs.getString("crop_name"));
                mp.setMarketPrice(rs.getDouble("market_price"));
                mp.setLastUpdated(rs.getDate("last_updated"));
                prices.add(mp);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return prices;
    }

    // 2. Add a new market price
    public boolean addMarketPrice(MarketPrice mp) {
        boolean rowInserted = false;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "INSERT INTO market_prices (crop_name, market_price, last_updated) VALUES (?, ?, ?)")) {

            ps.setString(1, mp.getCropName());
            ps.setDouble(2, mp.getMarketPrice());
            ps.setDate(3, java.sql.Date.valueOf(mp.getLastUpdated().toString()));

            rowInserted = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowInserted;
    }

    // 3. Get market price by ID
    public MarketPrice getMarketPriceById(int id) {
        MarketPrice mp = null;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "SELECT * FROM market_prices WHERE id = ?")) {

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                mp = new MarketPrice();
                mp.setId(rs.getInt("id"));
                mp.setCropName(rs.getString("crop_name"));
                mp.setMarketPrice(rs.getDouble("market_price"));
                mp.setLastUpdated(rs.getDate("last_updated"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return mp;
    }

    // 4. Update existing market price
    public boolean updateMarketPrice(MarketPrice mp) {
        boolean rowUpdated = false;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "UPDATE market_prices SET crop_name = ?, market_price = ?, last_updated = ? WHERE id = ?")) {

            ps.setString(1, mp.getCropName());
            ps.setDouble(2, mp.getMarketPrice());
            ps.setDate(3, java.sql.Date.valueOf(mp.getLastUpdated().toString()));
            ps.setInt(4, mp.getId());

            rowUpdated = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowUpdated;
    }

    // 5. Delete market price by ID
    public boolean deleteMarketPrice(int id) {
        boolean rowDeleted = false;

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(
                     "DELETE FROM market_prices WHERE id = ?")) {

            ps.setInt(1, id);

            rowDeleted = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rowDeleted;
    }
}
