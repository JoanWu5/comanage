package com.funding.crowd.service;

import com.funding.crowd.pojo.Group;
import com.funding.crowd.pojo.ProcessIntro;
import com.funding.crowd.pojo.Project;
import com.funding.crowd.pojo.Setting;
/**
 * 项目逻辑功能
 * @author liu
 *
 */
public interface ProjectService {

	//插入项目信息
	void submitProject(Project project);

	void submitProcess(ProcessIntro processintro);

	void submitSetting(Setting setting);

	void submitGroup(Group group);

	Group  getGroup(String username);
}
