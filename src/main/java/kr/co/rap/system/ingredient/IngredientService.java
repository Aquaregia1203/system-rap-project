package kr.co.rap.system.ingredient;

import java.util.List;
import java.util.Map;

public interface IngredientService {
    public List<Ingredient> viewIngredientList(Map<String, String> ingredient);

    public Ingredient viewIngredient(Ingredient ingredient);

    public boolean addIngredient(Ingredient ingredient);

    public boolean editIngredient(Ingredient ingredient);

    public boolean removeIngredient(Ingredient ingredient);
}
