package com.sinog2c.service.api.assessAndPunish;

import java.util.List;
import java.util.Map;

import com.sinog2c.model.assessAndPunish.TbsflowCaseCriminal;

public interface TbsflowCaseCriminalService {

	int deleteByPrimaryKey(String crimid);

    int insert(TbsflowCaseCriminal record);

    int insertSelective(TbsflowCaseCriminal record);

    TbsflowCaseCriminal selectByPrimaryKey(String crimid);

    int updateByPrimaryKeySelective(TbsflowCaseCriminal record);

    int updateByPrimaryKey(TbsflowCaseCriminal record);
    
    List<Map> selectByDateAndId(Map map);
	
    int getTbsflowCaseCriminalCount(Map map);
}
