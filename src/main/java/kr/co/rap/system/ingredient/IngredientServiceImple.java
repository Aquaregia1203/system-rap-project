package kr.co.rap.system.ingredient;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class IngredientServiceImple implements IngredientService{
    @Autowired
    private IngredientMapper ingredientMapper;


    public List<Ingredient> viewIngredientList(Map<String, String> ingredient) {
        if (ingredient.get("page") != null) {
            int limitNo = Integer.parseInt(ingredient.get("page"));
            ingredient.put("page", (limitNo * 10 - 10) + "");
        }

        return ingredientMapper.selectAll(ingredient);
    }


    public Ingredient viewIngredient(Ingredient ingredient) {
        return ingredientMapper.select(ingredient);
    }


    public boolean addIngredient(Ingredient ingredient) {
        Map<String, String> duplicate = new HashMap<String, String>();
        duplicate.put("name", ingredient.getName());

        List<Ingredient> duplicateIngredient = ingredientMapper.selectAll(duplicate);

        if (duplicateIngredient.size() == 1) {
            return false;
        }

        ingredientMapper.insert(ingredient);

        return true;
    }


    public boolean editIngredient(Ingredient ingredient) {
        Ingredient oldIngredient = ingredientMapper.select(ingredient);

        Map<String, String> duplicate = new HashMap<String, String>();
        duplicate.put("name", ingredient.getName());

        if ((!oldIngredient.getName().equals(ingredient.getName())
                    && ingredientMapper.selectAll(duplicate).size() != 0)
                        || oldIngredient.getUsedCount() != 0) {
            return false;
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
