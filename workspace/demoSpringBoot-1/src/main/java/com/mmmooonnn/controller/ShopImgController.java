package com.mmmooonnn.controller;
import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.model.ShopImgBean;
import com.mmmooonnn.service.ShopService;
import com.mmmooonnn.service.ShopImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.security.PublicKey;
import java.util.ArrayList;
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
    @GetMapping("/Shopimgdata/{productId}")
    public Map<String, Object> fetchShopData(@PathVariable Integer productId) {
        
        // 查找商品資料
        List<ShopBean> shopData = shopService.findById(productId);
        
        // 使用商品ID查找對應的所有圖片資料
        List<ShopImgBean> imgData = shopImgService.findById(productId);
        
        // 將資料存儲在 Map 中
        Map<String, Object> responseData = new HashMap<>();
        
        //回傳 兩個陣列
//      responseData.put("shopData", shopData);
//      responseData.put("imgData", imgData);
        
        //將兩個陣列 包成
        List<Object> TempData = new ArrayList<>();
        TempData.add(shopData);
        TempData.add(imgData);
        responseData.put("ShopData", TempData);
        
        


        return responseData;
    }
    
    //圖片getAll 是不是需要加進shopcontroller中getAll
//    @GetMapping("/getAllImg")
//    public String getAllImg(Model model) {
//    	List<ShopImgBean> shops = shopImgService.findAll();
//    	model.addAttribute("shops", shops);
//    	return "forward:/WEB-INF/jsp/GetAllShops.jsp";
//    }
    
    
    //抓所有副圖片
    @GetMapping("/getAllImg")
    public Map<String, Object> getAllImg() {
        List<ShopImgBean> shops = shopImgService.findAll();
        
        Map<String, Object> responseData = new HashMap<>();
        responseData.put("shops", shops);
        
        return responseData;
    }
    
    
    //使用productID 找尋該ID的所有副圖片
    @PostMapping("/findByImgproductid/{productId}")
    //public String FindById(Model model,@RequestParam(value = "productId", required = false) Integer productId) {
    public List<ShopImgBean> FindById(@PathVariable Integer productId) {
    	List<ShopImgBean> shops = shopImgService.findById(productId);
    	
    	return shops;
    	
    	//model.addAttribute("shops", shops);
        //return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    	} 
    
    @PostMapping("/findByImageid/{imageId}")
    public List<ShopImgBean> FindByImageid(@PathVariable Integer imageId){
    	List<ShopImgBean> shops = shopImgService.findByImageId(imageId);
    	
    	return shops;
    	//model.addAttribute("shops", shops);
        //return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    }
    
  //刪除
    @DeleteMapping("/deleteImg/{imageId}")
    public String del(@PathVariable Integer imageId) {
    	shopImgService.deleteById(imageId); 
    		return "刪除成功:" + imageId;
//    		return "forward:/WEB-INF/jsp/GetAllShops.jsp";
}
    
    
    //新增 確認實作方式再增加
    @PostMapping("/addShopImg")
//			 依照ID加圖片 再確認是不是ResponseEntity
    public ResponseEntity<String> uploadShopImg(Model model,
            @RequestParam(value="productId", required=true) Integer productId,
            @RequestParam(value="productImages", required=true) MultipartFile file){
    	ShopImgBean newShopImgBean = new ShopImgBean();
    	newShopImgBean.setProductId(productId);
    	
    	try {
        //設置保存圖片的目標路徑
    	//是否可以抓到最上面 做宣告 方便修改路徑
        String uploadDir = "C:/action/workspace/demoSpringBoot-1/src/main/webapp/img";
        //如果目錄不存在 創建目錄
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        // 保存上传的图片文件
        String filePath =  file.getOriginalFilename();
        
        System.err.println("filePath: " + filePath);
        file.transferTo(new File(dir,filePath));
        
        String Imgpath = "img/" + file.getOriginalFilename();
        
        // 图片上传成功，保存图片路径到数据库
    	List<ShopImgBean> shopList = shopImgService.findById(productId); //找該no的數據 回傳過來的是list<shop> 再抓取list第1筆資料
    	ShopImgBean shop = shopList.get(0);
        if (shop != null) {
            shop.setProductImages(Imgpath); // 设置图片路径
            shopImgService.update(shop); // 更新数据库中的记录
            return ResponseEntity.ok("Upload successful");
        }else {
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Shop not found");
        }

    } catch (IOException e) {
        e.printStackTrace();
        return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to upload file");
    }
}

    
    //修改
//    @PutMapping("/update")
//    public ResponseEntity<String> updateShopImg(Model modelm,
//    											@RequestParam()
//    											
//    											){
//    	
//    }
}
