package com.mmmooonnn.controller;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.service.ShopImgService;
import com.mmmooonnn.service.ShopService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.io.File;
import java.io.IOException;
import java.util.List;

@RestController
public class ShopController {

    
    @Autowired
    private ShopService sService;
    
    @Autowired
    private ShopImgService shopImgService;

//搜尋全部
    @GetMapping("/getall")
    public String getAll(Model model) {
    	List<ShopBean> shops = sService.findAll();
        model.addAttribute("shops", shops);
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    	}
//用no搜尋
    @PostMapping("/findByproductid")
    public String FindById(Model model,@RequestParam(value = "productid", required = false) Integer productid) {
    	List<ShopBean> shops = sService.findById(productid);
        model.addAttribute("shops", shops);
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    	}
//用product搜尋   
    @PostMapping("/findByproductname")
    public String FindByProduct(Model model,@RequestParam(value = "productname", required = false) String productname) {
    	//List<ShopBean> shops = sService.findByProductName(productname);
    	List<ShopBean> shops = sService.findByproductnameContaining(productname);
    	model.addAttribute("shops", shops);
    	return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    }
//用producttype搜尋
    @PostMapping("/findByproducttype")
    public String FindByproducttype(Model model,@RequestParam(value = "producttype", required = false) String producttype) {
    	List<ShopBean> shops = sService.findByProductType(producttype);
        model.addAttribute("shops", shops);
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    	}
    
//刪除
    @DeleteMapping("/delete/{productid}")
    public String del(@PathVariable Integer productid) {
    	sService.deleteById(productid); 
    		return "刪除成功:" + productid;
//    		return "forward:/WEB-INF/jsp/GetAllShops.jsp";
}
    
    
    
    //庫存刪除
    @PostMapping("/addShop")
    public String addShop(Model model,
                          @RequestParam(value="productname", required=true) String productname,
                          @RequestParam(value="productintroduce", required=true) String productintroduce,
                          @RequestParam(value="productprice", required=true) Integer productprice,
                          @RequestParam(value="producttype", required=true) String producttype) {
    	ShopBean newShop = new ShopBean();
        newShop.setProductName(productname);
        newShop.setProductIntroduce(productintroduce);
        newShop.setProductPrice(productprice);
        newShop.setProductType(producttype);
        
        sService.insert(newShop);
        
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    } 
 
    //Restful method update = putMapping, patchMapping
    //responseEntity 是回傳有沒有成功更新 需要在return回傳是否更新成功
    @PutMapping("/update")
    public ResponseEntity<String> updateShop(Model model,
            								 @RequestParam("productid") Integer productid,
                                             @RequestParam("productname") String productname,
                                             @RequestParam("productintroduce") String productintroduce,
                                             @RequestParam("productprice") Integer productprice,
                                             @RequestParam("producttype") String producttype) {
    	List<ShopBean> shopList = sService.findById(productid); //找該no的數據 回傳過來的是list<shop> 再抓取list第1筆資料
    	ShopBean shop = shopList.get(0);
        if (shop != null) {
            //更新商品
            shop.setProductName(productname);
            shop.setProductIntroduce(productintroduce);
            shop.setProductPrice(productprice);
            shop.setProductType(producttype);
            //保存更新後的訊息
            sService.update(shop);
            return ResponseEntity.ok("更新成功");
    }else {
        // 如果未找到商品，返回相应的状态码和消息
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("未找到商品");
    }
}

    
    
    @PostMapping("/uploadphoto")
    public ResponseEntity<String> uploadPhoto(@RequestParam("productid") Integer productid,
                                              @RequestParam("productimg") MultipartFile file) {
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body("Please select a file to upload");
        }

        try {
            // 设置保存图片文件的目录路径
            String uploadDir = "C:/action/workspace/demoSpringBoot-1/src/main/webapp/img";
            // 如果目录不存在，则创建目录
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
        	List<ShopBean> shopList = sService.findById(productid); //找該no的數據 回傳過來的是list<shop> 再抓取list第1筆資料
        	ShopBean shop = shopList.get(0);
            if (shop != null) {
                shop.setProductImg(Imgpath); // 设置图片路径
                sService.update(shop); // 更新数据库中的记录
                return ResponseEntity.ok("Upload successful");
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("Shop not found");
            }

        } catch (IOException e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Failed to upload file");
        }
    }

}