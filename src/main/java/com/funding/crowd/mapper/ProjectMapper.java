package com.funding.crowd.mapper;

import com.funding.crowd.pojo.Group;
import com.funding.crowd.pojo.ProcessIntro;
import com.funding.crowd.pojo.Project;
import com.funding.crowd.pojo.Setting;

public interface ProjectMapper {
/**
 * 项目各信息的增删改查
 */
	//插入项目信息
	void submitProject(Project project);
	//插入进程状态
	void submitProcess(ProcessIntro processintro);
	void submitSetting(Setting setting);
	void submitGroup(Group group);
	Group getGroup(String username);
}
