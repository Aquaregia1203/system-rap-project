package kr.co.rap.system.ingredient;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface IngredientMapper {
    public List<Ingredient> selectAll(Map<String, String> ingredient);

    public Ingredient select(Ingredient ingredient);

    public int insert(Ingredient ingredient);

    public int update(Ingredient ingredient);

    public int delete(Ingredient ingredient);

    public int count();
}
