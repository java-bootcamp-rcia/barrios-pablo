package com.pablo.product.tdd;

import static org.junit.Assert.*;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import junit.framework.TestCase;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import junit.framework.TestCase;

public class AppTest2 extends TestCase{
	private FileList otherList;
	
	@BeforeEach
    public void beforeTest(){
		otherList = new FileList();
    }
	
  @Test
    public void theListIsEmpty(){

        List newList1 = new ArrayList();
        boolean expectedResult = newList1.isEmpty();
        boolean actualResult = otherList.getMyList().isEmpty();

        assertEquals(expectedResult,actualResult);

    }
  
  @Test
	public void openAFileShouldMoveThisFile(){
      File file01 = new File("File1",01);
      File file02=  new File("File2",02);
      otherList.openFile(file01);
      otherList.openFile(file02);
      assertEquals(file02,otherList.getMyList().get(0));
	}
  
 


}
