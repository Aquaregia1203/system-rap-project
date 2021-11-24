package kr.co.rap.system.recipe;

import java.util.List;

public interface RecipeService {
    public List<Recipe> viewRecipeList(Recipe recipe);

    public Recipe viewRecipe(Recipe recipe);

    public boolean addRecipe(Recipe recipe);

    public boolean editRecipe(Recipe recipe);

    public boolean removeRecipe(Recipe recipe);
}
