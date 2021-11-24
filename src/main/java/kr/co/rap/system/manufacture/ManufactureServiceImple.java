package kr.co.rap.system.manufacture;

import kr.co.rap.system.recipe.Recipe;
import kr.co.rap.system.recipe.RecipeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ManufactureServiceImple {
    @Autowired
    private ManufactureMapper manufactureMapper;
    @Autowired
    private RecipeMapper recipeMapper;

    public List<Manufacture> viewManufactureList(Map<String, String> period) {
        return manufactureMapper.selectAll(period);
    }

    public Manufacture viewManufacture(Manufacture manufacture) {
        return manufactureMapper.select(manufacture);
    }

    public boolean addManufacture(Manufacture manufacture) {
        manufactureMapper.insert(manufacture);

        Recipe recipe = new Recipe();
        recipe.setNo(manufacture.getRecipeNo());
        recipe.setUsedCount(1);

        recipeMapper.update(recipe);

        return true;
    }

    public boolean editManufacture(Manufacture newManufacture) {
        Manufacture beforeManufacture =
                manufactureMapper.select(newManufacture);
        if (beforeManufacture == null
                || "Y".equals(beforeManufacture.getStatus())) {
            return false;
        }

        manufactureMapper.update(newManufacture);
        if (newManufacture.getRecipeNo() != beforeManufacture.getRecipeNo()) {
            Recipe recipe = new Recipe();

            recipe.setNo(newManufacture.getRecipeNo());
            recipe.setUsedCount(1);
            recipeMapper.update(recipe);

            recipe.setNo(beforeManufacture.getRecipeNo());
            recipe.setUsedCount(-1);
            recipeMapper.update(recipe);

            return true;
        }

        return false;
    }

    public boolean removeManufacture(Manufacture manufacture) {
        manufacture = manufactureMapper.select(manufacture);

        if ("Y".equals(manufacture.getStatus())) {
            return false;
        }

        Recipe recipe = new Recipe();
        recipe.setNo(manufacture.getRecipeNo());
        recipe.setUsedCount(-1);
        recipeMapper.update(recipe);

        manufactureMapper.delete(manufacture);

        return false;
    }

    public boolean executeManufacture(Manufacture manufacture) {
        return false;
    }
}
