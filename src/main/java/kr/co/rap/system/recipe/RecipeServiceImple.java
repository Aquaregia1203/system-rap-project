package kr.co.rap.system.recipe;

import kr.co.rap.system.ingredient.IngredientMapper;
import kr.co.rap.system.ingredient.Ingredient;
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

        if (recipe != null) {
            List<Mix> mixList = mixMapper.selectAll(recipe);

            Ingredient ingredient = new Ingredient();
            for (int i = 0; i < mixList.size(); i++) {
                ingredient.setNo(mixList.get(i).getIngredientNo());
                ingredient = ingredientMapper.select(ingredient);

                mixList.get(i).setIngredientName(ingredient.getName());
            }

            recipe.setMixList(mixList);

            return recipe;
        }

        return recipe;
    }

    public boolean addRecipe(Recipe recipe) {
        List<Mix> mixList = recipe.getMixList();

        int ratio = mixList.get(0).getRatio();

        for (int i = 1; i < mixList.size(); i++) {
            for (int j = 0; j < mixList.size() - 1; j ++) {
                int no = mixList.get(j).getIngredientNo();
                int nextNo = mixList.get(i).getIngredientNo();
                int pumpNo = mixList.get(j).getPumpNo();
                int nextPumpNo = mixList.get(i).getPumpNo();

                if (no == nextNo
                        && pumpNo == nextPumpNo) {
                    return false;
                }
            }

            ratio = ratio + mixList.get(i).getRatio();
        }

        if (ratio != 100
                || recipeMapper.selectAll(recipe).size() != 0) {
            return false;
        }

        recipeMapper.insert(recipe);

        for (Mix mix : mixList) {
            mix.setRecipeNo(recipe.getNo());
            mixMapper.insert(mix);

            Ingredient ingredient = new Ingredient();
            ingredient.setNo(mix.getIngredientNo());
            ingredient.setUsedCount(1);

            ingredientMapper.update(ingredient);
        }

        return true;
    }

    public boolean editRecipe(Recipe recipe) {
        List<Mix> mixList = recipe.getMixList();

        int ratio = mixList.get(0).getRatio();

        for (int i = 1; i < mixList.size(); i++) {
            for (int j = 0; j < mixList.size() - 1; j ++) {
                int no = mixList.get(j).getIngredientNo();
                int nextNo = mixList.get(i).getIngredientNo();
                int pumpNo = mixList.get(j).getPumpNo();
                int nextPumpNo = mixList.get(i).getPumpNo();

                if (no == nextNo
                        && pumpNo == nextPumpNo) {
                    return false;
                }
            }

            ratio = ratio + mixList.get(i).getRatio();
        }

        if (ratio != 100
                || recipeMapper.selectAll(recipe).size() != 0) {
            return false;
        }

        Recipe checkRecipe = recipeMapper.select(recipe);

        if (checkRecipe == null
                && checkRecipe.getUsedCount() != 0) {
            return false;
        }

        recipeMapper.update(recipe);

        List<Mix> newMixList = recipe.getMixList();
        List<Mix> oldMixList = mixMapper.selectAll(checkRecipe);
        Ingredient ingredient = new Ingredient();

        for (Mix mix : newMixList) {
            ingredient.setNo(mix.getIngredientNo());
            ingredient.setUsedCount(1);
            ingredientMapper.update(ingredient);

            mixMapper.update(mix);
        }

        for (Mix mix : oldMixList) {
            ingredient.setNo(mix.getIngredientNo());
            ingredient.setUsedCount(-1);
            ingredientMapper.update(ingredient);
        }

        return true;
    }

    public boolean removeRecipe(Recipe recipe) {
        recipe = recipeMapper.select(recipe);

        if (recipe.getUsedCount() != 0) {
            return false;
        }

        List<Mix> mixList = mixMapper.selectAll(recipe);

        for (Mix tempMix : mixList) {
            Ingredient ingredient = new Ingredient();

            ingredient.setNo(tempMix.getIngredientNo());
            ingredient.setUsedCount(-1);

            ingredientMapper.update(ingredient);
        }

        Mix mix = new Mix();
        mix.setRecipeNo(recipe.getNo());
        mixMapper.delete(mix);
        recipeMapper.delete(recipe);

        return true;
    }
}
