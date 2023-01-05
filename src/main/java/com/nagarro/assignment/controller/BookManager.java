package com.nagarro.assignment.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.nagarro.assignment.model.BookAuthors;
import com.nagarro.assignment.model.Books;
import com.nagarro.assignment.model.User;

@Controller
public class BookManager {
	
	@RequestMapping("/addBook")
	public String addBookPage(Model model) {
		
		RestTemplate restTemplate = new RestTemplate();
		MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
		mappingJackson2HttpMessageConverter.setSupportedMediaTypes(Arrays.asList(MediaType.APPLICATION_JSON, MediaType.APPLICATION_OCTET_STREAM));
		restTemplate.getMessageConverters().add(mappingJackson2HttpMessageConverter);
		ResponseEntity<List<BookAuthors>> responseEntity = restTemplate.exchange("http://localhost:8888/author", HttpMethod.GET, null, new ParameterizedTypeReference<List<BookAuthors>>() {});
		List<BookAuthors> authors = responseEntity.getBody();
		model.addAttribute("author_list", authors);
		return "AddBook";
	}

	@RequestMapping("/addBookForm")
	public String addBook(@ModelAttribute Books book, Model model) {
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
	    HttpEntity<Books> entity = new HttpEntity<Books>(book,headers);
	    restTemplate.exchange("http://localhost:8888/book", HttpMethod.POST, entity, Books.class);
		return "redirect:bookList";
	}
	
	@RequestMapping("/editBook")
	public String editBookPage(@RequestParam("code") int code, Model model) {
		
		RestTemplate restTemplate = new RestTemplate();
		MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter = new MappingJackson2HttpMessageConverter();
		mappingJackson2HttpMessageConverter.setSupportedMediaTypes(Arrays.asList(MediaType.APPLICATION_JSON, MediaType.APPLICATION_OCTET_STREAM));
		restTemplate.getMessageConverters().add(mappingJackson2HttpMessageConverter);
		ResponseEntity<Books> responseEntity = restTemplate.exchange("http://localhost:8888/book/"+code, HttpMethod.GET, null, Books.class);
		Books books = responseEntity.getBody();
		model.addAttribute("book", books);
		ResponseEntity<List<BookAuthors>> reEntity = restTemplate.exchange("http://localhost:8888/author", HttpMethod.GET, null, new ParameterizedTypeReference<List<BookAuthors>>() {});
		List<BookAuthors> authors = reEntity.getBody();
		model.addAttribute("author_list", authors);
		return "EditBook";
	}
	
	@RequestMapping("/editBookForm")
	public String editBook(@ModelAttribute Books book, Model model) {
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
	    HttpEntity<Books> entity = new HttpEntity<Books>(book,headers);
	    restTemplate.exchange("http://localhost:8888/book/"+book.getCode(), HttpMethod.PUT, entity, Books.class);
		return "redirect:bookList";
	}
	
	@RequestMapping("/deleteBook")
	public String deleteBook(@RequestParam("code") int code, Model model) {
		
		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
	    HttpEntity<Books> entity = new HttpEntity<Books>(headers);
	    restTemplate.exchange("http://localhost:8888/book/"+code, HttpMethod.DELETE, entity, Void.class);
		return "redirect:bookList";
	}
}
