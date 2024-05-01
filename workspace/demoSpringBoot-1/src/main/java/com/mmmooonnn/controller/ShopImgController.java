package com.mmmooonnn.controller;
import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.model.ShopImgBean;
import com.mmmooonnn.service.ShopService;
import com.mmmooonnn.service.ShopImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.security.PublicKey;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

@RestController
public class ShopImgController {
	
    @Autowired
    private ShopService shopService;
    
    @Autowired
    private ShopImgService shopImgService;


    //使用商品ID 查找所有的商品資訊 以及圖片
    @GetMapping("/ShopData")
    public Map<String, Object> fetchShopData() {
    	//找100000 ID的商品
        Integer productId = 100000;
        
        // 查找商品資料
        List<ShopBean> shopData = shopService.findById(productId);
        
        // 使用商品ID查找對應的所有圖片資料
        List<ShopImgBean> imgData = shopImgService.findByProductId(productId);
        
        // 將資料存儲在 Map 中
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("shopData", shopData);
        responseData.put("imgData", imgData);
        
        return responseData;
    }
    
    //圖片getAll 是不是需要加進shopcontroller中getAll
//    @GetMapping("/getAllImg")
//    public String getAllImg(Model model) {
//    	List<ShopImgBean> shops = shopImgService.findAll();
//    	model.addAttribute("shops", shops);
//    	return "forward:/WEB-INF/jsp/GetAllShops.jsp";
//    }
    
    @GetMapping("/getAllImg")
    public Map<String, Object> getAllImg() {
        List<ShopImgBean> shops = shopImgService.findAll();
        
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("shops", shops);
        
        return responseData;
    }
    
    @PostMapping("/findByImgproductid")
    public String FindById(Model model,@RequestParam(value = "productId", required = false) Integer productId) {
    	List<ShopImgBean> shops = shopImgService.findByProductId(productId);
        model.addAttribute("shops", shops);
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    	} 
    
  //刪除
    @DeleteMapping("/delete/{imageId}")
    public String del(@PathVariable Integer imageId) {
    	shopImgService.deleteById(imageId); 
    		return "刪除成功:" + imageId;
//    		return "forward:/WEB-INF/jsp/GetAllShops.jsp";
}
    
    
    //新增 確認實作方式再增加
//    @PostMapping("/addShopImg")
//			 依照ID加圖片 再確認是不是ResponseEntity
//    public ResponseEntity<String> uploadShopImg(){
//    	
//    }
    
    //修改
//    @PutMapping("/update")
//    public ResponseEntity<String> updateShopImg(){
//    	
//    }
}
