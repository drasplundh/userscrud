package com.example.userscrud.service;

import java.util.List;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.userscrud.entity.User;
import com.example.userscrud.exception.UserNotFoundException;
import com.example.userscrud.repository.UserRepository;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	

	@Autowired
	private UserRepository userRepository;


	@Override
	public List<User> getAllUsers() {
		return userRepository.findAll();
	}

	@Override
	public User createUser(User user) {
		return userRepository.save(user);
	}

//	public User getUser(String email) {
//		User user = userRepository.findByEmailAddress(email);
//		if(user == null) {
//			throw new UserNotFoundException("User with email : "+email+" doesn't exist.");
//		}
//
//		return user;
//	}

//	@Override
//	public void deleteUser(String email) {
//		User user = userRepository.findByEmailAddress(email);
//		userRepository.delete(user);
//	}

	@Override
	@Transactional
	public void deleteUserByName(String name) {
		System.out.println("NAME PASSED: " + name);
		List<User> users = userRepository.getByName(name);
		int nameCount = 0;
		for (User user : users){
			System.out.println("user: " + user.getName() + " email: " + user.getEmail());
			if (user.getName().equals(name)) {
				nameCount++;
			}
		}
		if (nameCount != 1) {
			System.out.println("Multiple users with same name, cannot delete!");
		} else {
			System.out.println("Delete should execute");
			userRepository.deleteByName(name);
		}
	}

}
