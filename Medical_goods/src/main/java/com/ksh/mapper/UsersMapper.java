package com.ksh.mapper;

import java.util.ArrayList;

import com.ksh.model.UsersVO;

public interface UsersMapper {

	public ArrayList<UsersVO> users(UsersVO users);

	public UsersVO logIn(UsersVO users);
}
