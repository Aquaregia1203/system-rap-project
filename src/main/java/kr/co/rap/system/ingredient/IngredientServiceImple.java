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
        String checkIngredient = ingredient.getName();
        String duplicateIngredient = ingredientMapper.selectAll(ingredient).get(0).getName();

        if (checkIngredient.equals(duplicateIngredient)) {
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
            if (duplicateIngredient.size() == 1) {
                return false;
            }
        }
        ingredientMapper.update(ingredient);
        return true;
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
