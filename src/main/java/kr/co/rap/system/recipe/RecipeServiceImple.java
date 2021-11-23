package kr.co.rap.system.recipe;

import kr.co.rap.system.ingredient.IngredientMapper;
import kr.co.rap.system.model.Ingredient;
import kr.co.rap.system.model.Manager;
import kr.co.rap.system.model.Mix;
import kr.co.rap.system.model.Recipe;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RecipeServiceImple {
    private static Logger logger
            = LogManager.getLogger(RecipeServiceImple.class);
    @Autowired
    private RecipeMapper recipeMapper;
    @Autowired
    private MixMapper mixMapper;
    @Autowired
    private IngredientMapper ingredientMapper;

    public List<Recipe> viewRecipeList(Recipe recipe) {
        return recipeMapper.selectAll(recipe);
    }

    public Recipe viewRecipe(Recipe recipe) {
        recipe = recipeMapper.select(recipe);

        Mix mix = new Mix();
        mix.setRecipeNo(recipe.getNo());

        List<Mix> mixList = mixMapper.selectAll(mix);
        recipe.setMixList(mixList);

        return recipe;
    }

    public boolean addRecipe(Recipe recipe) {
        List<Mix> mixList = recipe.getMixList();

        int ratio = 0;
        for (int i = 0; i < mixList.size(); i++) {
            ratio = ratio + mixList.get(i).getRatio();
        }

        if (ratio != 100
                || recipeMapper.select(recipe) == null) {
            return false;
        }

        recipeMapper.insert(recipe);

        for (Mix mix : mixList) {
            mixMapper.insert(mix);

            Ingredient ingredient = new Ingredient();
            ingredient.setNo(mix.getIngredientNo());
            ingredient.setUsedCount(1);

            ingredientMapper.update(ingredient);
        }

        return true;
    }

    public boolean editRecipe(Recipe recipe) {
        if (recipeMapper.select(recipe) == null
                || recipeMapper.select(recipe).getNo() != 0) {
            return false;
        } else if (recipe.getName() != null) {
            if (recipeMapper.selectAll(recipe) != null) {
                return false;
            }
        }

        recipeMapper.update(recipe);
        
        List<Mix> mixList = recipe.getMixList();
        for (Mix mix : mixList) {
            mixMapper.update(mix);
        }
        // TODO:: 원재료 수정 로직 필요

        return true;
    }

    public boolean removeRecipe(Recipe recipe) {
        recipe = recipeMapper.select(recipe);
        if (recipe == null
                || recipe.getUsedCount() == 0) {
            return false;
        }

        Mix mix = new Mix();
        mix.setRecipeNo(recipe.getNo());
        List<Mix> mixList = mixMapper.selectAll(mix);

        for (Mix mixs : mixList) {
            Ingredient ingredient = new Ingredient();

            ingredient.setNo(mixs.getIngredientNo());
            ingredient.setUsedCount(-1);

            ingredientMapper.update(ingredient);
        }

        mixMapper.delete(mix);
        recipeMapper.delete(recipe);

        return true;
    }
}
