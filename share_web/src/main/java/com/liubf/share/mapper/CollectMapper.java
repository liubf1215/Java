package com.liubf.share.mapper;

import com.liubf.share.pojo.Collect;
import com.liubf.share.pojo.CollectExample;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollectMapper {
    int countByExample(CollectExample example);

    int deleteByExample(CollectExample example);



    int insert(Collect record);

    int insertSelective(Collect record);

    List<Collect> selectByExample(CollectExample example);


    int updateByExampleSelective(@Param("record") Collect record, @Param("example") CollectExample example);

    int updateByExample(@Param("record") Collect record, @Param("example") CollectExample example);

    int updateByPrimaryKeySelective(Collect record);

    int updateByPrimaryKey(Collect record);
}