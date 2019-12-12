package com.pablo.product.tdd;

/**
 * Clase Main
 *
 */
public class App 
{
    public static void main( String[] args )
    {
    	 FileList newList=new FileList();

         File new01=new File("Pablo",23);
         File new02=new File("Leandro",25);
         File new03=new File("Yasuo",30);
         File new04=new File("Vayne",40);
         File new05=new File("Zed",50);
         File new06=new File("Darius",60);
         File new07=new File("Garen",70);
         File new08=new File("Nasus",80);
         File new09=new File("Shen",90);
         File new10=new File("Jhin",10);
         File new11=new File("Draven",22);
         File new12=new File("Jax",24);
         File lastPost=new File("Ultimo",01);

         //newList.addFile(new01);
         //newList.addFile(new02);

         newList.openFile(new12);

         newList.openFile(new01);
         newList.openFile(new02);
         newList.openFile(new03);
         newList.openFile(new04);
         newList.openFile(new05);
         newList.openFile(new06);
         newList.openFile(new07);
         newList.openFile(new08);
         newList.openFile(new09);
         newList.openFile(new10);
         newList.openFile(new11);
         newList.openFile(new12);
         newList.openFile(lastPost);

         newList.removeFile(new12);

         newList.showList();

    }
}
