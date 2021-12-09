package kr.co.rap.system.manufacture;

import kr.co.rap.system.control.ControlService;
import kr.co.rap.system.control.ControlServiceImple;
import kr.co.rap.system.recipe.*;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ManufactureServiceImple implements ManufactureService {
    @Autowired
    private ManufactureMapper manufactureMapper;
    @Autowired
    private RecipeMapper recipeMapper;
    @Autowired
    private ControlService controlService;
    @Autowired
    private MixMapper mixMapper;

    public List<Manufacture> viewManufactureList(Map<String, String> period) {
        if (period.get("page") != null) {
            String limitNo = String.valueOf(Integer.parseInt(period.get("page")) * 10 - 10);
            period.put("page", limitNo);
        }

        return manufactureMapper.selectAll(period);
    }

    public Manufacture viewManufacture(Manufacture manufacture) {
        manufacture = manufactureMapper.select(manufacture);

        double errorAmount = manufacture.getErrorAmount() / 1000.0;
        manufacture.setErrorAmount(errorAmount);

        return manufacture;
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
        }

        return true;
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

        return true;
    }

    public InputInfo executeManufacture(Manufacture manufacture) {
        Recipe recipe = new Recipe();
        recipe.setNo(manufacture.getRecipeNo());
        List<Mix> mixList = mixMapper.selectAll(recipe);

        List<Map<String, String>> pumpInfo = new ArrayList<Map<String, String>>();
        Map<String, String> pumpAndInput = null;

        for (Mix mix : mixList) {
            int input = (int) (manufacture.getOutput() * 1000 * mix.getRatio() * 0.01);

            pumpAndInput = new HashMap<String, String>();
            pumpAndInput.put("input", input + "");
            pumpAndInput.put("pumpNo", mix.getPumpNo() + "");

            pumpInfo.add(pumpAndInput);
        }

        InputInfo inputInfo = new InputInfo();
        inputInfo.setPumpInfo(pumpInfo);

        return inputInfo;
    }
}
