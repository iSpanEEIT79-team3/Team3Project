package com.mmmooonnn.controller;
import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.model.ShopImgBean;
import com.mmmooonnn.model.ShopQuantityBean;
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

        //將兩個陣列 包成
        List<Object> TempData = new ArrayList<>();
        TempData.add(shopData);
        TempData.add(imgData);
        responseData.put("ShopData", TempData);

        return responseData;
    }

 
  //刪除
    @DeleteMapping("/deleteImg")
    public ResponseEntity<String> deleteImg(@RequestParam Integer imageId) {
    	shopImgService.deleteById(imageId); 
    		return ResponseEntity.ok("ok");
}
    @PostMapping("/updateImg")
    public ResponseEntity<String> updateImg(Model model,
    										@RequestParam(value="imageId", required=true) Integer imageId,
    										@RequestParam(value="productImg", required=true) MultipartFile file) {
    	
    	List<ShopImgBean> shopImgList = shopImgService.findByImageId(imageId);
    	ShopImgBean shopImg = shopImgList.get(0);
    	
    	String uploadDir = "C:\\team3\\workspace\\demoSpringBoot-1\\src\\main\\resources\\static\\images";
        //如果目錄不存在 創建目錄
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }
        // 保存上传的图片文件
        String filePath =  file.getOriginalFilename();
        
        try {
			System.err.println("filePath: " + filePath);
			file.transferTo(new File(dir,filePath));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
        String Imgpath = "images/" + file.getOriginalFilename();
        shopImg.setProductImages(Imgpath);
        
        shopImgService.update(shopImg);
    	
    	return ResponseEntity.ok("ok");
}

    @PostMapping("/uploadImages")
//			 依照ID加圖片 再確認是不是ResponseEntity
    public ResponseEntity<String> uploadShopImg(Model model,
    		@RequestParam(value="productId", required=true) Integer productId,
            @RequestParam(value="productImg", required=true) List<MultipartFile> files){
    	
    	try {
        //設置保存圖片的目標路徑
    	//是否可以抓到最上面 做宣告 方便修改路徑
        String uploadDir = "C:\\team3\\workspace\\demoSpringBoot-1\\src\\main\\resources\\static\\images";
        //如果目錄不存在 創建目錄
        File dir = new File(uploadDir);
        if (!dir.exists()) {
            dir.mkdirs();
        }

        for (MultipartFile file : files) {
        	
            if (file.isEmpty()) {
                continue;
            }
        	// 保存上传的图片文件
        	String filePath =  file.getOriginalFilename();
        	
        	System.err.println("filePath: " + filePath);
        	file.transferTo(new File(dir,filePath));
        
        	String Imgpath = "images/" + file.getOriginalFilename();
        	
        	ShopImgBean newShop = new ShopImgBean();
        	newShop.setProductId(productId);
        	newShop.setProductImages(Imgpath);
        	shopImgService.insert(newShop);
        }
        return ResponseEntity.ok("ok");
        
    	}catch (Exception e) {
    		e.printStackTrace();
    		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("上傳圖片發生錯誤");
		}
}
    
    @PostMapping("/refreshImages")
//	 依照ID加圖片 再確認是不是ResponseEntity
public ResponseEntity<String> refreshImages(Model model,
		@RequestParam(value="imageId", required=true) List<Integer> imageIds,
        @RequestParam(value="imgSrc", required=true) List<String> imgSrcs){

        try {
            for (int i = 0; i < imageIds.size(); i++) {
                Integer imageId = imageIds.get(i);
                String imgSrc = imgSrcs.get(i);
                // 处理每个图片ID和SRC的逻辑...
                System.out.println("Image ID: " + imageId);
                System.out.println("Image Src: " + imgSrc);
            	List<ShopImgBean> shopImgList = shopImgService.findByImageId(imageId);
            	ShopImgBean shopImg = shopImgList.get(0);  
            	
            	shopImg.setProductImages(imgSrc);
            	shopImgService.update(shopImg);
            }
            return ResponseEntity.ok("ok");

}catch (Exception e) {
	e.printStackTrace();
	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("上傳圖片發生錯誤");
}
    }
}
