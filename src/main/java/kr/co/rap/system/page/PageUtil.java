package kr.co.rap.system.page;

import kr.co.rap.system.ingredient.IngredientMapper;
import kr.co.rap.system.manager.ManagerMapper;
import kr.co.rap.system.manufacture.ManufactureMapper;
import kr.co.rap.system.recipe.RecipeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.Map;


@Component
public class PageUtil {
    @Autowired
    private ManagerMapper managerMapper;
    @Autowired
    private RecipeMapper recipeMapper;
    @Autowired
    private ManufactureMapper manufactureMapper;
    @Autowired
    private IngredientMapper ingredientMapper;

    public String getNavigator(Map<String, String> resource) {
        int count = 0;
        int page = Integer.parseInt(resource.get("page"));

        if ("/manager".equals(resource.get("url"))) {
            count = managerMapper.count(resource);
        } else if ("/recipe".equals(resource.get("url"))) {
            count = recipeMapper.count(resource);
        } else if ("/manufacture-plan".equals(resource.get("url"))) {
            count = manufactureMapper.count(resource);
        } else if ("/ingredient".equals(resource.get("url"))) {
            count = ingredientMapper.count(resource);
        }

        int totalPage = count % 10 != 0
                        ? (count / 10) + 1
                        : count / 10;

        if (totalPage == 0) {
            return "";
        }

        int temp = page % 5 != 0
                   ? (page / 5) + 1
                   : (page / 5);

        int printEnd = temp * 5;
        int printStart = printEnd - 4;

        return buildString(totalPage, printStart, printEnd, page);
    }

    private String buildString(int totalPage, int printStart, int printEnd, int page) {
        StringBuffer tag = new StringBuffer();

        tag.append("<div class='dataTables_paginate paging_simple_numbers '>")
           .append("    <ul class='pagination justify-content-center' >");

        if (page > 1) {
            tag.append("    <li class='paginate_button page-item previous'>")
               .append("        <button type='button' onclick='navigatePage(this.id)' id='pageButton0' class='page-link'>이전</button>");
        } else {
            tag.append("    <li class='paginate_button page-item previous disabled'>")
               .append("        <button type='button' onclick='navigatePage(this.id)' id='pageButton0' class='page-link'>이전</button>");
        }

        tag.append("    </li>");

        for (int i = printStart, id = 1; i <= printEnd; i++, id++) {
            if (i == page) {
                tag.append("    <li class='paginate_button page-item active'>")
                   .append("        <button type='button' onclick='navigatePage(this.id)' id='pageButton" + id + "' class='page-link' value='" + i + "'>" + i + "</button>")
                   .append("    </li>");
            } else {
                tag.append("    <li class='paginate_button page-item'>")
                   .append("        <button type='button' onclick='navigatePage(this.id)' id='pageButton" + id + "' class='page-link' value='" + i + "'>" + i + "</button>")
                   .append("    </li>");
            }

            if (i == totalPage) {
                break;
            }
        }

        if (page == totalPage) {
            tag.append("    <li class='paginate_button page-item next disabled' id='c'>")
               .append("        <button type='button' onclick='navigatePage(this.id)' id='pageButton6' class='page-link'>다음</button>")
               .append("    </li>")
               .append("    </ul>")
               .append("</div>");
        } else {
            tag.append("    <li class='paginate_button page-item next' id='c'>")
               .append("        <button type='button' onclick='navigatePage(this.id)' id='pageButton6' class='page-link'>다음</button>")
               .append("    </li>")
               .append("    </ul>")
               .append("</div>");
        }

        return tag.toString();
    }
}
