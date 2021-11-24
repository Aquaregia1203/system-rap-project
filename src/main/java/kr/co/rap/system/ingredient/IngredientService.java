package kr.co.rap.system.ingredient;

import java.util.List;

public interface IngredientService {
    public List<Ingredient> viewIngredientList(Ingredient ingredient);
    public Ingredient viewIngredient(Ingredient ingredient);
    public boolean addIngredient(Ingredient ingredient);
    public boolean editIngredient(Ingredient ingredient);
    public boolean removeIngredient(Ingredient ingredient);
}
