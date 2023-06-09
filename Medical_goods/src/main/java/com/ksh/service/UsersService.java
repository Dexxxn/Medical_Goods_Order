package com.ksh.service;

import java.util.ArrayList;

import com.ksh.model.UsersVO;

public interface UsersService {
	// 부서-이름 select(비동기식)
	public ArrayList<UsersVO> users(UsersVO users);

	// 로그인
	public UsersVO logIn(UsersVO users);
}
