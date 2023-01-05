package com.nagarro.assignment.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import com.nagarro.assignment.model.Books;
import com.nagarro.assignment.model.User;
import com.nagarro.assignment.service.UserService;


@Controller
public class HomeManager {

	@Autowired
	private UserService userService;

	@RequestMapping("/")
	public String login(Model model) {
		model.addAttribute("incorrect", true);
		return "loginPage";
	}

	@RequestMapping(path = "/processform", method = RequestMethod.POST)
	public String handleForm(@ModelAttribute User user, Model model) {

		boolean isUser = userService.getUser(user);
		if (isUser) {
			return "redirect:bookList";
		}
		model.addAttribute("incorrect", isUser);
		return "loginPage";

	}
	
	@RequestMapping("/bookList")
	public String bookList(Model model) {
		
		RestTemplate restTemplate = new RestTemplate();
		MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
		mappingJackson2HttpMessageConverter.setSupportedMediaTypes(Arrays.asList(MediaType.APPLICATION_JSON, MediaType.APPLICATION_OCTET_STREAM));
		restTemplate.getMessageConverters().add(mappingJackson2HttpMessageConverter);
		ResponseEntity<List<Books>> responseEntity = restTemplate.exchange("http://localhost:8888/book", HttpMethod.GET, null, new ParameterizedTypeReference<List<Books>>() {});
		List<Books> books = responseEntity.getBody();
		model.addAttribute("book_list", books);
		return "bookList";
	}
	
	@RequestMapping("/logout")
	public String logout(Model model) {
		model.addAttribute("incorrect", true);
		return "loginPage";
	}
}
