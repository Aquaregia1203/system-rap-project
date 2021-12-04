package kr.co.rap.system.page;

import kr.co.rap.system.ingredient.IngredientMapper;
import kr.co.rap.system.manager.ManagerMapper;
import kr.co.rap.system.manufacture.ManufactureMapper;
import kr.co.rap.system.recipe.RecipeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


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

    public String getNavigator(String url, int page) {
        int count = 0;

        if ("/manager".equals(url)) {
            count = managerMapper.count();
        } else if ("/recipe".equals(url)) {
            count = recipeMapper.count();
        } else if ("/manufacture-plan".equals(url)) {
            count = manufactureMapper.count();
        } else if ("/ingredient".equals(url)) {
            count = ingredientMapper.count();
        }

        int totalPage = count % 10 != 0
                        ? (count / 10) + 1
                        : count / 10;

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
           .append("    <ul class='pagination' >");

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
