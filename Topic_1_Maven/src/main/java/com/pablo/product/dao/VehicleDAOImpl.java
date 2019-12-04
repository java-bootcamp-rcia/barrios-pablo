package com.pablo.product.dao;

import java.util.HashMap;
import java.util.Map;

import com.pablo.product.Vehicle;

public class VehicleDAOImpl implements VehicleDAO {
	
    Map<Integer,Vehicle> vehicles=new HashMap<Integer, Vehicle>();

	public void create(Vehicle vehicle) {
		vehicles.put(vehicle.getPrice(), vehicle);

	}

	public Vehicle read(int id) {
		return vehicles.get(id);
	}

	public void update(Vehicle vehicle) {
		// TODO Auto-generated method stub

	}

	public void delete(int id) {
		// TODO Auto-generated method stub

	}

}
