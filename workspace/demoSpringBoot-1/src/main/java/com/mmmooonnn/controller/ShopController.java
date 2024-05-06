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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.model.ShopImgBean;
import com.mmmooonnn.model.ShopQuantityBean;
import com.mmmooonnn.service.ShopImgService;
import com.mmmooonnn.service.ShopQuantityService;
import com.mmmooonnn.service.ShopService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class ShopController {
//getAll 			get123 re.GetAllShops
//getAllShop		get123 re.Shops
//findByproductid
//findByproductname
//findByproducttype
//
//
//
//
//
    @Autowired
    private ShopService shopService;
    
    @Autowired
    private ShopImgService shopImgService;
    
    @Autowired
    private ShopQuantityService shopQuanService;

//搜尋全部
    @GetMapping("/getAll")
    public String getAll(Model model) {
    	List<ShopBean> shops = shopService.findAll();
    	List<ShopImgBean> shopImgs = shopImgService.findAll();
    	List<ShopQuantityBean> shopQuan = shopQuanService.findAll();
        model.addAttribute("shops", shops);
        model.addAttribute("shopImgs", shopImgs);
        model.addAttribute("shopQuan", shopQuan);
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    	}
    @GetMapping("/getAllShop")
    public String getAllShop(Model model) {
    	List<ShopBean> shops = shopService.findAll();
    	List<ShopImgBean> shopImgs = shopImgService.findAll();
    	List<ShopQuantityBean> shopQuan = shopQuanService.findAll();
        model.addAttribute("shops", shops);
        model.addAttribute("shopImgs", shopImgs);
        model.addAttribute("shopQuan", shopQuan);
        return "forward:/WEB-INF/jsp/Shops.jsp";
    	}

//用id搜尋
    @PostMapping("/findByproductid")
    public String FindById(Model model,@RequestParam(value = "productId", required = false) Integer productId) {
    	List<ShopBean> shops = shopService.findById(productId);
    	List<ShopImgBean> shopImgs = shopImgService.findById(productId);
    	List<ShopQuantityBean> shopQuan = shopQuanService.findById(productId);
        model.addAttribute("shops", shops);
        model.addAttribute("shopImgs", shopImgs);
        model.addAttribute("shopQuan", shopQuan);
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    	}
//用商品名name搜尋   
    @PostMapping("/findByproductname")
    public String FindByProduct(Model model,@RequestParam(value = "productName", required = false) String productName) {
    	List<ShopBean> shops = shopService.findByproductnameContaining(productName);
    	int productId = 0;
    	int count=0;
        List<ShopImgBean> shopImgs = new ArrayList<>();
        List<ShopQuantityBean> shopQuan = new ArrayList<>();
        
    	for (ShopBean shop : shops) {
    	    productId = shop.getProductId();
    	    count++;
    	}
    	if(count==1) {
    		shopImgs = shopImgService.findById(productId);
    		shopQuan = shopQuanService.findById(productId);
    		model.addAttribute("shopImgs", shopImgs);
    		model.addAttribute("shopQuan", shopQuan);
    	}
    	
    	model.addAttribute("shops", shops);
    	return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    }
//用類別type搜尋
    @PostMapping("/findByproducttype")
    public String FindByproducttype(Model model,@RequestParam(value = "productType", required = false) String productType) {
    	List<ShopBean> shops = shopService.findByProductType(productType);
    	int productId = 0;
    	int count=0;
        List<ShopImgBean> shopImgs = new ArrayList<>();
        List<ShopQuantityBean> shopQuan = new ArrayList<>();
        
    	for (ShopBean shop : shops) {
    	    productId = shop.getProductId();
    	    count++;
    	}
    	
    	//判斷是否只有一筆 要在前端輸出所有資訊的 有多筆就只要丟商品資訊
    	if(count==1) {
    		shopImgs = shopImgService.findById(productId);
    		shopQuan = shopQuanService.findById(productId);
    		model.addAttribute("shopImgs", shopImgs);
    		model.addAttribute("shopQuan", shopQuan);
    	}
        model.addAttribute("shops", shops);
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    	}
    

    @DeleteMapping("/deleteShop")
    public ResponseEntity<String> del(@RequestParam Integer productId) {
    	shopService.deleteById(productId); 
    	return ResponseEntity.ok("ok");
//    		return "forward:/WEB-INF/jsp/GetAllShops.jsp";
}

    @PostMapping("/addShop")
    public String addShop(Model model,
                          @RequestParam(value="productName", required=true) String productName,
                          @RequestParam(value="productIntroduce", required=true) String productIntroduce,
                          @RequestParam(value="productPrice", required=true) Integer productPrice,
                          @RequestParam(value="productType", required=true) String productType) {
    	ShopBean newShop = new ShopBean();
        newShop.setProductName(productName);
        newShop.setProductIntroduce(productIntroduce);
        newShop.setProductPrice(productPrice);
        newShop.setProductType(productType);
        
        shopService.insert(newShop);
        
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    } 
 
    //Restful method update = putMapping, patchMapping
    //responseEntity 是回傳有沒有成功更新 需要在return回傳是否更新成功
    @PutMapping("/update")
    public ResponseEntity<String> updateShop(Model model,
            								 @RequestParam("productId") Integer productId,
                                             @RequestParam("productName") String productName,
                                             @RequestParam("productIntroduce") String productIntroduce,
                                             @RequestParam("productPrice") Integer productPrice,
                                             @RequestParam("productType") String productType) {
    	List<ShopBean> shopList = shopService.findById(productId); //找該no的數據 回傳過來的是list<shop> 再抓取list第1筆資料
    	ShopBean shop = shopList.get(0);
        if (shop != null) {
            //更新商品
            shop.setProductName(productName);
            shop.setProductIntroduce(productIntroduce);
            shop.setProductPrice(productPrice);
            shop.setProductType(productType);
            //保存更新後的訊息
            shopService.update(shop);
            return ResponseEntity.ok("更新成功");
    }else {
        // 如果未找到商品，返回相应的状态码和消息
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("未找到商品");
    }
}
    @GetMapping("/Shopproduct/{productId}")
    public String FindShopById(Model model,@RequestParam(value = "productId", required = false) Integer productId) {
    	List<ShopBean> shops = shopService.findById(productId);
    	List<ShopImgBean> shopImgs = shopImgService.findById(productId);
    	List<ShopQuantityBean> shopQuan = shopQuanService.findById(productId);
        model.addAttribute("shops", shops);
        model.addAttribute("shopImgs", shopImgs);
        model.addAttribute("shopQuan", shopQuan);
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    }
    
    
    @PostMapping("/uploadphoto")
    public ResponseEntity<String> uploadPhoto(@RequestParam("productId") Integer productId,
                                              @RequestParam("productimg") MultipartFile file) {
        if (file.isEmpty()) {
            return ResponseEntity.badRequest().body("Please select a file to upload");
        }

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
        	List<ShopBean> shopList = shopService.findById(productId); //找該no的數據 回傳過來的是list<shop> 再抓取list第1筆資料
        	ShopBean shop = shopList.get(0);
            if (shop != null) {
                shop.setProductImg(Imgpath); // 设置图片路径
                shopService.update(shop); // 更新数据库中的记录
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