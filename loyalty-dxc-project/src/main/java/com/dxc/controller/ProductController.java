package com.dxc.controller;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;


import com.dxc.entity.Product;
import com.dxc.repository.ProductRepository;


@Controller
@SessionAttributes("account")
public class ProductController {
	
	@Autowired
	private ProductRepository productRepository;
	public static List<Product> products= new ArrayList<>();

	@RequestMapping(value = "/product", method = RequestMethod.GET)
	public String show(Model model, Product product,HttpSession http){
		model.addAttribute("product",productRepository.findAll());
		return "product-manager";
	}
	@RequestMapping(value = "/product/{id}", method = RequestMethod.GET)
	public String findByProductId(@PathVariable("id") int id, Model model,HttpSession http) {
		Product result = productRepository.findByProdid(id);
		model.addAttribute("product", result);
		products.add(result);
		http.setAttribute("prodselected", products);
		return "redirect:/payment";
	}
	@RequestMapping(value = "/product/delete/{id}", method = RequestMethod.GET)
	public String delete(@PathVariable("id") int id) {
		Product result = productRepository.findByProdid(id);
		if (result == null) {
			return "The id not exist";
		}
		productRepository.delete(result);
		return "redirect:/product";
	}
	@RequestMapping(value = "/product/save", method = RequestMethod.POST)
	public String save(@Valid Product product) throws Exception{
		productRepository.save(product);
		return "redirect:/product";
	}
	@RequestMapping(value = "/product/update", method = RequestMethod.POST)
	public String update(@Valid Product product) throws IOException {
		productRepository.updateProduct(product.getProdid(), product.getName(), product.getPrice(), product.getPoint() );		
		return "redirect:/product";
	}
}
