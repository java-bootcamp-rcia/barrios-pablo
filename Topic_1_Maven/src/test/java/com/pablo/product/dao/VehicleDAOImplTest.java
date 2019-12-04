package com.pablo.product.dao;

import static org.junit.Assert.*;

import org.junit.Test;

import com.pablo.product.Vehicle;

public class VehicleDAOImplTest {

	@Test
	public void createShouldCreateAVehicle() {
		VehicleDAO dao= new VehicleDAOImpl();
		Vehicle vehicle = new Vehicle();
		vehicle.setId(1);
		vehicle.setModel("Ford");
		vehicle.setName("Pablo");
		vehicle.setPrice(5000);
		dao.create(vehicle);
		
		
		
		
		
	}

}
