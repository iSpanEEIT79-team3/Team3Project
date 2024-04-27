package com.mmmooonnn.controller;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.service.ShopService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.io.File;
import java.io.IOException;
import java.util.List;

@Controller
public class ShopController {

    
    @Autowired
    private ShopService sService;

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
    @PostMapping("/del")
    public String del(Model model,
            @RequestParam(value = "productid", required = false) Integer productid) {
     
    	sService.deleteById(productid);
    		
    		return "forward:/WEB-INF/jsp/GetAllShops.jsp";
}
    
    @PostMapping("/addShop")
    public String addShop(Model model,
                          @RequestParam(value="productname", required=true) String productname,
                          @RequestParam(value="productintroduce", required=true) String productintroduce,
                          @RequestParam(value="productprice", required=true) Integer productprice,
                          @RequestParam(value="productquantity", required=true) Integer productquantity,
                          @RequestParam(value="producttype", required=true) String producttype) {
        // 创建一个新的商品对象并设置属性值
    	ShopBean newShop = new ShopBean();
        newShop.setProductname(productname);
        newShop.setProductintroduce(productintroduce);
        newShop.setProductprice(productprice);
        newShop.setProductquantity(productquantity);
        newShop.setProducttype(producttype);
        
        // 调用 DAO 层的方法将新商品保存到数据库中
        sService.insert(newShop);
        
        // 返回到商品列表页面
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
        
    } 
 
   // Restful method update = putMapping, patchMapping
    @PostMapping("/update")
    public String updateShop(Model model,
            								 @RequestParam("productid") Integer productid,
                                             @RequestParam("productname") String productname,
                                             @RequestParam("productintroduce") String productintroduce,
                                             @RequestParam("productprice") Integer productprice,
                                             @RequestParam("productquantity") Integer productquantity,
                                             @RequestParam("producttype") String producttype) {
    	List<ShopBean> shopList = sService.findById(productid); //找該no的數據 回傳過來的是list<shop> 再抓取list第1筆資料
    	ShopBean shop = shopList.get(0);
        if (shop != null) {
            // 更新商品信息
            shop.setProductname(productname);
            shop.setProductintroduce(productintroduce);
            shop.setProductprice(productprice);
            shop.setProductquantity(productquantity);
            shop.setProducttype(producttype);
            // 保存更新后的商品信息
            sService.update(shop);
    }
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
}

    @PostMapping("/uploadphoto")
    public ResponseEntity<String> uploadPhoto(@RequestParam("productid") Integer productid,
                                              @RequestParam("productimg") MultipartFile file) {
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body("Please select a file to upload");
        }

        try {
            // 设置保存图片文件的目录路径
            String uploadDir = "D:/team3/workspace/demoSpringBoot-1/src/main/webapp/img";
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
                shop.setProductimg(Imgpath); // 设置图片路径
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