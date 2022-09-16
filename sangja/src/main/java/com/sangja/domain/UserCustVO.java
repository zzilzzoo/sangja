package com.sangja.domain;

import java.util.List;

public class UserCustVO {

	private int chb = 0;
	private int mng_user_num = 0;
	private int cust_num = 0;

	private List<UserCustVO> UserCustVOList;

	public int getChb() {
		return chb;
	}

	public void setChb(int chb) {
		this.chb = chb;
	}

	public int getMng_user_num() {
		return mng_user_num;
	}

	public void setMng_user_num(int mng_user_num) {
		this.mng_user_num = mng_user_num;
	}

	public int getCust_num() {
		return cust_num;
	}

	public void setCust_num(int cust_num) {
		this.cust_num = cust_num;
	}

	public List<UserCustVO> getUserCustVOList() {
		return UserCustVOList;
	}

	public void setUserCustVOList(List<UserCustVO> userCustVOList) {
		UserCustVOList = userCustVOList;
	}

}
