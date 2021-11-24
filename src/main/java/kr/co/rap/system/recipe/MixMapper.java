package kr.co.rap.system.recipe;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MixMapper {
    public List<Mix> selectAll(Recipe recipe);

    public int insert(Mix mix);

    public int update(Mix mix);

    public int delete(Mix mix);
}
