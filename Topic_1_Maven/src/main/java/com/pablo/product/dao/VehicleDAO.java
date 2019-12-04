package com.pablo.product.dao;

import com.pablo.product.Vehicle;

public interface VehicleDAO {
	
	void create (Vehicle vehicle);
	
	Vehicle read(int id);
	
	void update(Vehicle vehicle);
	
	void delete(int id);

}
