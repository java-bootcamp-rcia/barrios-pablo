package com.pablo.product.tdd;

public class File {



    private String name;
    private double size;
    public File(){
        this.name="";
        this.size=0;
    }

    public File(String name,double size){
        this.name=name;
        this.size=size;
    }
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getSize() {
        return size;
    }

    public void setSize(double size) {
        this.size = size;
    }


}
