package kr.co.rap.system.model;

import java.io.Serializable;

public class Mix implements Serializable {
    private int no;
    private int recipeNo;
    private int ingredientNo;
    private int pumpNo;
    private int ratio;

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getRecipeNo() {
        return recipeNo;
    }

    public void setRecipeNo(int recipeNo) {
        this.recipeNo = recipeNo;
    }

    public int getIngredientNo() {
        return ingredientNo;
    }

    public void setIngredientNo(int ingredientNo) {
        this.ingredientNo = ingredientNo;
    }

    public int getPumpNo() {
        return pumpNo;
    }

    public void setPumpNo(int pumpNo) {
        this.pumpNo = pumpNo;
    }

    public int getRatio() {
        return ratio;
    }

    public void setRatio(int ratio) {
        this.ratio = ratio;
    }
}
