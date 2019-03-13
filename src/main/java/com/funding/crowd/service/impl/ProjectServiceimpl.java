package com.funding.crowd.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.funding.crowd.mapper.ProjectMapper;
import com.funding.crowd.pojo.Group;
import com.funding.crowd.pojo.ProcessIntro;
import com.funding.crowd.pojo.Project;
import com.funding.crowd.pojo.Setting;
import com.funding.crowd.service.ProjectService;

@Service
public class ProjectServiceimpl implements ProjectService {

	
	@Autowired
	private ProjectMapper projectmapper;
	
	@Override
	public void submitProject(Project project) {
		// TODO Auto-generated method stub
		projectmapper.submitProject(project);
	}

	@Override
	public void submitProcess(ProcessIntro processintro) {
		// TODO Auto-generated method stub
		projectmapper.submitProcess(processintro);
	}

	@Override
	public void submitSetting(Setting setting) {
		// TODO Auto-generated method stub
		projectmapper.submitSetting(setting);
	}

	@Override
	public void submitGroup(Group group) {
		// TODO Auto-generated method stub
		projectmapper.submitGroup(group);
	}

	@Override
	public Group getGroup(String username) {
		Group group=projectmapper.getGroup(username);
		return group;
	}

}
