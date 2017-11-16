package com.qingshixun.project.action;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;
import com.qingshixun.project.model.User;
import com.qingshixun.project.service.UserService;

@Component
public class UserAction extends ActionSupport implements ModelDriven<User>{

	private static final long serialVersionUID = 1L;
	
	@Autowired
	private UserService userService;
	private int pageNo = 1;

	private User user;

	private List<User> list;
	
	//縂頁數
	private int totalPages;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public List<User> getList() {
		return list;
	}

	public void setList(List<User> list) {
		this.list = list;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}

	public String getUserList() {
		list = userService.getUserPage(pageNo, 5);
		totalPages = userService.getTotalPage(5);
		return "success";
	}
	
	public String addUser(){
		user.setCreateTime(new Date());
		user.setUpdateTime(new Date());
		userService.addStudent(user);
		return SUCCESS;
	}
	
	public String deleteUser(){
		userService.deleteUserById(user.getId());
		return SUCCESS;
	}
	
	public String toEditUser(){
		user = userService.getUserById(user.getId());
		return SUCCESS;
	}
	
	public String editUser(){
		user.setUpdateTime(new Date());
		userService.updateUser(user);
		return SUCCESS;
	}
	
	//查询条件
	private String condition;
	
	
	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	// 查询函数
	public String queryFromUser(){
		System.out.println("temp::"+condition);
		list = userService.queryFromUser(condition);
		return SUCCESS;
	}

	@Override
	public User getModel() {
		return user;
	}
	
	private Map<String, Object> dataMap = new HashMap<>();

	public Map<String, Object> getDataMap() {
		return dataMap;
	}

	public void setDataMap(Map<String, Object> dataMap) {
		this.dataMap = dataMap;
	}
	
	public String getGenderRate(){
		int male = userService.getGenderAmount(true);
		int female = userService.getGenderAmount(false);
		dataMap.put("male", male);
		dataMap.put("female", female);
		return SUCCESS;
	}
	
	public String getAmmountByDate(){
		List<Date> tempDate = userService.getAmmountByDate();
		List<String> date = new ArrayList<>();
		//日期轉換為字符串類型
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		for(int i = 0;i<tempDate.size();i++){
			String temp= formatter.format(tempDate.get(i));
			date.add(temp);
		}
		
		//判斷日期中人數
		Map<String,Integer> numMap = new HashMap<>();
		for(int i = 0;i<date.size();i++){
			if(!numMap.containsKey(date.get(i))){
				numMap.put(date.get(i), 1);
			}else{
				int count = numMap.get(date.get(i))+1;
				numMap.put(date.get(i), count);
			}
		}
		
		List<Integer> numList = new ArrayList<>();
		
		for(Map.Entry<String, Integer> entry : numMap.entrySet()){
			numList.add(entry.getValue());
		}
		
		
		//將date中重複日期去除
		List<String> xAxis = new ArrayList<>();
		for(int i = 0;i<date.size();i++){
			if(!xAxis.contains(date.get(i))){
				xAxis.add(date.get(i));
			}
		}
		
		//將人數數據中重複數字去除
		List<Integer> yAxis = new ArrayList<>();
		yAxis = numList;
		for(int i = 0;i<yAxis.size()-1;i++){
			Integer temp= yAxis.get(i);
			if(temp == yAxis.get(i+1)){
				date.remove(i+1);
			}
		}
		Object[] array = yAxis.toArray();
		Arrays.sort(array);
		
		// 添加到json中
		dataMap.put("date", xAxis.toArray());
		dataMap.put("num", numList.toArray());
		dataMap.put("yAxis", array);
		return SUCCESS;
	}
	
}
