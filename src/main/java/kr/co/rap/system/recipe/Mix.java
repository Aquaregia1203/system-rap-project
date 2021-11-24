package kr.co.rap.system.recipe;

import java.io.Serializable;

public class Mix implements Serializable {
    private int no;
    private int recipeNo;
    private String recipeName;
    private int ingredientNo;
    private String ingredientName;
    private int pumpNo;
    private int ratio;

    public Mix() {
    }

    public String getIngredientName() {
        return ingredientName;
    }

    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

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
