package com.pablo.product.tdd;

import java.util.ArrayList;
import java.util.*;

public class FileList {

    private List<File> myList;

    public FileList(){
        this.myList = new ArrayList<File>();
    }


    public void addFile(File file){
        myList.add(file);
    }
    public void removeFile(File file){
        myList.remove(file);
    }

    public File openFile(File file) {

        if (myList.contains(file)) {
            File toMoveUp = file;
            while (myList.indexOf(toMoveUp) != 0) {
                int i = myList.indexOf(toMoveUp);
                Collections.swap(myList, i, i - 1);
            }

        } else {
            myList.add(file);
            File toMoveUp = file;
            while (myList.indexOf(toMoveUp) != 0) {
                int i = myList.indexOf(toMoveUp);
                Collections.swap(myList, i, i - 1);

            }

        }

        if (myList.size() > 10) {
            myList.remove(myList.size() - 1);
        }
        return file;
    }


    public void showList(){
        for(int i=0;i<myList.size();i++){
            System.out.println(myList.get(i).getName());
        }
    }


    public void setMyList(List<File> myList) {
        this.myList = myList;
    }

    public List<File> getMyList() {
        return myList;
    }

}
