package kr.co.rap.system.model;

import java.io.Serializable;
import java.util.Date;

public class Manufacture implements Serializable {
    private int no;
    private String manufactureDate;
    private int recipeNo;
    private int output;
    private int id;
    private int errorAmount;
    private String addDate;
    private char status;

    public Manufacture() {
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getManufactureDate() {
        return manufactureDate;
    }

    public void setManufactureDate(String manufactureDate) {
        this.manufactureDate = manufactureDate;
    }

    public int getRecipeNo() {
        return recipeNo;
    }

    public void setRecipeNo(int recipeNo) {
        this.recipeNo = recipeNo;
    }

    public int getOutput() {
        return output;
    }

    public void setOutput(int output) {
        this.output = output;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getErrorAmount() {
        return errorAmount;
    }

    public void setErrorAmount(int errorAmount) {
        this.errorAmount = errorAmount;
    }

    public String getAddDate() {
        return addDate;
    }

    public void setAddDate(String addDate) {
        this.addDate = addDate;
    }

    public char getStatus() {
        return status;
    }

    public void setStatus(char status) {
        this.status = status;
    }
}
