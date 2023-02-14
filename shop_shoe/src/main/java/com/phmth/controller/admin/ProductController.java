package com.phmth.controller.admin;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.phmth.common.Constant;
import com.phmth.entities.ProductEntity;
import com.phmth.services.IProductService;
import com.phmth.utils.UploadFileUtil;

@RestController("/admin")
public class ProductController {
	
	@SuppressWarnings("unused")
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	@Qualifier("productService")
	private IProductService productService;
	
	@GetMapping("/admin/product")
	public ModelAndView productPage(@RequestParam(value = "page", 
												  required = false, 
												  defaultValue = "1") int page) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_ADMIN_PRODUCT);
		int limit = 6;
		Sort sort = Sort.by(Sort.Direction.DESC, "id");
		Pageable pageable = PageRequest.of(page-1, limit, sort);
		Page<ProductEntity> listPageProduct = productService.getAllProduct(pageable);
		List<ProductEntity> listProduct = listPageProduct.getContent();
		mav.addObject("currentPage", page);
		mav.addObject("totalPage", listPageProduct.getTotalPages());
		mav.addObject("listProduct", listProduct);
		return mav;
	}
	@GetMapping("/admin/product/{id}")
	public ModelAndView getEditProduct( @PathVariable long id,
										@RequestParam(value = "pageProduct", 
													  required = false, 
													  defaultValue = "1") int pageProduct) {
		ModelAndView mav = new ModelAndView(Constant.PAGE_ADMIN_EDIT_PRODUCT);
		if(id == 0) {
			mav.addObject("product", new ProductEntity());
			mav.addObject("add", "add");
		}else {
			mav.addObject("product", productService.getProductById(id));
			mav.addObject("edit", "edit");
		}
		mav.addObject("pageProduct", pageProduct);
		return mav;
	}
	private boolean isFileImage(MultipartFile fileImage) {
		if(fileImage != null && !fileImage.isEmpty()) {
			return true;
		}
		return false;
	}
	@PostMapping("/admin/product/edit")
	public ModelAndView postEditProduct(@RequestParam(value="fileImage", 
													  required = false) MultipartFile fileImage, 
										@ModelAttribute("product") ProductEntity product,
										@RequestParam("pageProduct") int pageProduct) throws Exception {
		ModelAndView mav = new ModelAndView(Constant.REDIRECT_PAGE_ADMIN_PRODUCT+"?page="+pageProduct);
		String fileName = "";
		if(isFileImage(fileImage)) {
			fileName = StringUtils.cleanPath(fileImage.getOriginalFilename());
			product.setImage(fileName);
		}
		if(product.getId() == null) {
			productService.addProduct(product);
		}else {
			productService.editProduct(product);
		}
		if(isFileImage(fileImage)) {
			String uploadDir = "D:/workspace/springboot/shop_shoe/shop_shoe/src/main/webapp/template/web/img/products/";
			UploadFileUtil.saveFile(uploadDir, fileName, fileImage);
		}
		return mav;
	}
	@GetMapping("/admin/product/delete/{id}")
	public ModelAndView DeleteProduct(  @PathVariable long id, 
										@RequestParam("pageProduct") int pageProduct)  {
		ModelAndView mav = new ModelAndView(Constant.REDIRECT_PAGE_ADMIN_PRODUCT+"?page="+pageProduct);
		productService.deleteProduct(id);
		return mav;
	}
}
