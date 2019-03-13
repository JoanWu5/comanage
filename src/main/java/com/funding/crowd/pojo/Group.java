package com.funding.crowd.pojo;

public class Group {

	private String groupName;
	private String groupbreifIntro;
	private String participantId;
	private String managerId;
	//用于和project表联合查询
	private Project project;
	private String groupImage;
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	
	
	public String getGroupbreifIntro() {
		return groupbreifIntro;
	}
	public void setGroupbreifIntro(String groupbreifIntro) {
		this.groupbreifIntro = groupbreifIntro;
	}
	public String getParticipantId() {
		return participantId;
	}
	public void setParticipantId(String participantId) {
		this.participantId = participantId;
	}
	public String getManagerId() {
		return managerId;
	}
	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}
	public String getGroupImage() {
		return groupImage;
	}
	public void setGroupImage(String groupImage) {
		this.groupImage = groupImage;
	}
	
}
