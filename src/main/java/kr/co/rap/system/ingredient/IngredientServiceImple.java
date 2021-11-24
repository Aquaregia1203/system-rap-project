package kr.co.rap.system.ingredient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IngredientServiceImple {
    @Autowired
    private IngredientMapper ingredientMapper;


    public List<Ingredient> viewIngredientList(Ingredient ingredient) {
        List<Ingredient> rows = ingredientMapper.selectAll(ingredient);
        return rows;
    }


    public Ingredient viewIngredient(Ingredient ingredient) {
        Ingredient row = ingredientMapper.select(ingredient);
        return row;
    }


    public boolean addIngredient(Ingredient ingredient) {
        List<Ingredient> checkIngredient = ingredientMapper.selectAll(ingredient);
        if (checkIngredient.size() != 0) {
            return false;
        }
        ingredientMapper.insert(ingredient);
        return true;
    }


    public boolean editIngredient(Ingredient ingredient) {
        Ingredient checkIngredient = ingredientMapper.select(ingredient);

        if (checkIngredient != null
                && checkIngredient.getUsedCount() == 0) {
            List<Ingredient> duplicateIngredient = ingredientMapper.selectAll(ingredient);
            if (duplicateIngredient.isEmpty()) {
                ingredientMapper.update(ingredient);
                return true;
            }
        }
        return false;
    }

    public boolean removeIngredient(Ingredient ingredient) {
        Ingredient checkIngredient = ingredientMapper.select(ingredient);
        if (checkIngredient.getUsedCount() == 0) {
            ingredientMapper.delete(ingredient);
            return true;
        }
        return false;
    }
}
