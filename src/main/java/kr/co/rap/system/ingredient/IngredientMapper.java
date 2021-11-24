package kr.co.rap.system.ingredient;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface IngredientMapper {
    public List<Ingredient> selectAll(Ingredient ingredient);
    public Ingredient select(Ingredient ingredient);
    public int insert(Ingredient ingredient);
    public int update(Ingredient ingredient);
    public int delete(Ingredient ingredient);
}
