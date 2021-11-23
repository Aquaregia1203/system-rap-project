package kr.co.rap.system.recipe;

import kr.co.rap.system.model.Recipe;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public interface RecipeService {
    public List<Recipe> viewRecipeList(Recipe recipe);

    public Recipe viewRecipe(Recipe recipe);

    public boolean addRecipe(Recipe recipe);

    public boolean editRecipe(Recipe recipe);

    public boolean removeRecipe(Recipe recipe);
}
