package kr.co.rap.system.manufacture;

import java.io.Serializable;

public class Manufacture implements Serializable {
    private int no;
    private String manufactureDate;
    private int recipeNo;
    private String recipeName;
    private double output;
    private String id;
    private String managerName;
    private double errorAmount;
    private String addDate;
    private String status;

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

    public double getOutput() {
        return output;
    }

    public void setOutput(double output) {
        this.output = output;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public double getErrorAmount() {
        return errorAmount;
    }

    public void setErrorAmount(double errorAmount) {
        this.errorAmount = errorAmount;
    }

    public String getAddDate() {
        return addDate;
    }

    public void setAddDate(String addDate) {
        this.addDate = addDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

    public String getManagerName() {
        return managerName;
    }

    public void setManagerName(String managerName) {
        this.managerName = managerName;
    }
}
