package kr.co.rap.system.recipe;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface RecipeMapper {
    public List<Recipe> selectAll(Recipe recipe);

    public Recipe select(Recipe recipe);

    public int insert(Recipe recipe);

    public int update(Recipe recipe);

    public int delete(Recipe recipe);
}
