package com.ksh.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ksh.mapper.UsersMapper;
import com.ksh.model.UsersVO;

@Service
public class UsersServiceImpl implements UsersService {

	@Autowired
	UsersMapper um;

	@Override
	public ArrayList<UsersVO> users(UsersVO users) {
		return um.users(users);
	}

	public UsersVO logIn(UsersVO users) {
		return um.logIn(users);
	}
}
