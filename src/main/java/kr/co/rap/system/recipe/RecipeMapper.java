package kr.co.rap.system.recipe;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;
import java.util.Map;

@Mapper
public interface RecipeMapper {
    public List<Recipe> selectAll(Map<String, String> recipe);

    public Recipe select(Recipe recipe);

    public int insert(Recipe recipe);

    public int update(Recipe recipe);

    public int delete(Recipe recipe);

    public int count();
}
