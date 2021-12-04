package kr.co.rap.system.recipe;

import java.util.List;
import java.util.Map;

public interface RecipeService {
    public List<Recipe> viewRecipeList(Map<String, String> recipe);

    public Recipe viewRecipe(Recipe recipe);

    public boolean addRecipe(Recipe recipe);

    public boolean editRecipe(Recipe recipe);

    public boolean removeRecipe(Recipe recipe);
}
