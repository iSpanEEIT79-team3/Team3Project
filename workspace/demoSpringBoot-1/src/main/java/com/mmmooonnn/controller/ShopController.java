package com.mmmooonnn.controller;

import org.springframework.stereotype.Controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.mmmooonnn.model.Quanproduct;
import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.model.ShopImgBean;
import com.mmmooonnn.model.ShopQuantityBean;
import com.mmmooonnn.model.ShopcartBean;
import com.mmmooonnn.model.UsersBeanNew;
import com.mmmooonnn.service.ShopImgService;
import com.mmmooonnn.service.ShopQuantityService;
import com.mmmooonnn.service.ShopService;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.io.File;
import java.io.IOException;
import java.security.PublicKey;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Controller
public class ShopController {

    @Autowired
    private ShopService shopService;
    
    @Autowired
    private ShopImgService shopImgService;
    
    @Autowired
    private ShopQuantityService shopQuanService;

//進前台
    @GetMapping("/getAllShop")
    public String getAllShopTest(Model model) {
    	List<ShopBean> shops = shopService.findAll();
    	List<ShopImgBean> shopImgs = shopImgService.findAll();
    	List<ShopQuantityBean> shopQuan = shopQuanService.findAll();
    	model.addAttribute("shops", shops);
    	model.addAttribute("shopImgs", shopImgs);
    	model.addAttribute("shopQuan", shopQuan);
    	return "forward:/WEB-INF/jsp/front/shop/Shops.jsp";
    }    
    @GetMapping("/openbackshop")
    public String openbackshop(Model model) {
    	List<ShopBean> shops = shopService.findAll();
    	List<ShopImgBean> shopImgs = shopImgService.findAll();
    	List<ShopQuantityBean> shopQuan = shopQuanService.findAll();
    	model.addAttribute("shops", shops);
    	model.addAttribute("shopImgs", shopImgs);
    	model.addAttribute("shopQuan", shopQuan);
    	return "forward:/WEB-INF/jsp/back/shop/backShop.jsp";
    	
    }
    @GetMapping("/openshopid/{productId}")
    public String openshopid(Model model,@PathVariable(value = "productId", required = false) Integer productId) {
    	List<ShopBean> shops = shopService.findById(productId);
    	List<ShopImgBean> shopImgs = shopImgService.findById(productId);
    	List<ShopQuantityBean> shopQuan = shopQuanService.findById(productId);
    	model.addAttribute("shops", shops);
    	model.addAttribute("shopImgs", shopImgs);
    	model.addAttribute("shopQuan", shopQuan);
    	return "forward:/WEB-INF/jsp/back/shop/backShopID.jsp";
    	
    }

    @DeleteMapping("/deleteShop")
    public ResponseEntity<String> del(@RequestParam Integer productId) {
    	shopService.deleteById(productId); 
    	return ResponseEntity.ok("ok");
}

    @PostMapping("/addShop")
    public ResponseEntity<String> addShop(Model model,
                          @RequestParam(value="productName", required=true) String productName,
                          @RequestParam(value="productImg", required=true) MultipartFile file,
                          @RequestParam(value="productIntroduce", required=true) String productIntroduce,
                          @RequestParam(value="productPrice", required=true) Integer productPrice,
                          @RequestParam(value="productType", required=true) String productType,
                          @RequestParam(value="xsSize", required=true) Integer xsSize,
	                      @RequestParam(value="sSize", required=true) Integer sSize,
	                      @RequestParam(value="mSize", required=true) Integer mSize,
	                      @RequestParam(value="lSize", required=true) Integer lSize,
	                      @RequestParam(value="xlSize", required=true) Integer xlSize) {
    	ShopBean newShop = new ShopBean();
        newShop.setProductName(productName);
        newShop.setProductIntroduce(productIntroduce);
        newShop.setProductPrice(productPrice);
        newShop.setProductType(productType);
        
        String uploadDir = "D:/Team3/workspace/demoSpringBoot-1/src/main/resources/static/images";
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
        newShop.setProductImg(Imgpath);
        
        
        shopService.insert(newShop);
        
        //抓新增商品自己建立的ID 用這ID插入庫存
        int productId = newShop.getProductId();
        
        ShopQuantityBean QuanShop = new ShopQuantityBean();
        QuanShop.setProductId(productId);
        QuanShop.setXsSize(xsSize);
        QuanShop.setsSize(sSize);
        QuanShop.setmSize(mSize);
        QuanShop.setlSize(lSize);
        QuanShop.setXlSize(xlSize);
	    shopQuanService.insert(QuanShop);
	    return ResponseEntity.ok("更新成功");
    } 
 
    //Restful method update = putMapping, patchMapping
    //responseEntity 是回傳有沒有成功更新 需要在return回傳是否更新成功
    @PutMapping("/update")
    public ResponseEntity<String> updateShop(Model model,
            								 @RequestParam("productId") Integer productId,
                                             @RequestParam("productName") String productName,
                                             @RequestParam("productIntroduce") String productIntroduce,
                                             @RequestParam("productPrice") Integer productPrice,
                                             @RequestParam("productType") String productType,
                                             @RequestParam("xsSize") Integer xsSize,
	                   	                      @RequestParam("sSize") Integer sSize,
	                   	                      @RequestParam("mSize") Integer mSize,
	                   	                      @RequestParam("lSize") Integer lSize,
	                   	                      @RequestParam("xlSize") Integer xlSize) {
    	List<ShopBean> shopList = shopService.findById(productId); //找該no的數據 回傳過來的是list<shop> 再抓取list第1筆資料
    	List<ShopQuantityBean> shopQuanList = shopQuanService.findById(productId);
    	ShopBean shop = shopList.get(0);
    	ShopQuantityBean shopQuan = shopQuanList.get(0);
        if (shop != null) {
            //更新商品
            shop.setProductName(productName);
            shop.setProductIntroduce(productIntroduce);
            shop.setProductPrice(productPrice);
            shop.setProductType(productType);
            //保存更新後的訊息
            shopQuan.setXsSize(xsSize);
            shopQuan.setsSize(sSize);
            shopQuan.setmSize(mSize);
            shopQuan.setlSize(lSize);
            shopQuan.setXlSize(xlSize);
            
            shopService.update(shop);
            shopQuanService.update(shopQuan);
            
            return ResponseEntity.ok("更新成功");
            
    }else {
        // 如果未找到商品，返回相应的状态码和消息
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("未找到商品");
    }
}
    @GetMapping("/Shopproduct/{productId}")
    public String FindShopById(Model model,@PathVariable(value = "productId", required = false) Integer productId) {
    	List<ShopBean> shops = shopService.findById(productId);
    	List<ShopImgBean> shopImgs = shopImgService.findById(productId);
    	List<ShopQuantityBean> shopQuan = shopQuanService.findById(productId);
        model.addAttribute("shops", shops);
        model.addAttribute("shopImgs", shopImgs);
        model.addAttribute("shopQuan", shopQuan);
        
        
        List<ShopBean> allShops  = shopService.findAll();
        // 随机打乱列表
        Collections.shuffle(allShops);
        // 取前 4 条数据
        List<ShopBean> randomShops = allShops.subList(0, Math.min(4, allShops.size()));
        model.addAttribute("randomShops", randomShops);
        
        return "forward:/WEB-INF/jsp/front/shop/ShopsDetails.jsp";
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
            String uploadDir = "D:/Team3/workspace/demoSpringBoot-1/src/main/resources/static/images";
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
//加入購物車
    @PostMapping("/Shopproduct/addShopcart")
    public ResponseEntity<String> addcarshop(@RequestParam("productId") Integer productId,
    										@RequestParam("productName") String productName,
								    		@RequestParam("productImg") String productImg,
								    		@RequestParam("productPrice") Integer productPrice,
								    		@RequestParam("Size") String Size,
								    		@RequestParam("quantity") Integer quantity,
								    		HttpSession session){
    	
    	List<ShopcartBean> productList = (List<ShopcartBean>) session.getAttribute("productData");
        if (productList == null) {
            productList = new ArrayList<>();
        }
        
        // 創建 ShopcartBean 對象
        ShopcartBean newProduct = new ShopcartBean(productId,productName, productImg, productPrice, Size, quantity);
        // 將新的產品資料添加到列表中
        productList.add(newProduct);
        // 將更新後的列表存放回 Session 中
        session.setAttribute("productData", productList);
    	return ResponseEntity.ok("ok");
	}
//查看購物車內東西  
    @GetMapping("/Shopproduct/getShopcart")
    public String getShopcart(HttpSession session,Model model){
    	List<ShopcartBean> productList = (List<ShopcartBean>) session.getAttribute("productData");
    	    model.addAttribute("productList", productList);
    	Object users = session.getAttribute("usersBean");
    		model.addAttribute("users", users);
    	    return "forward:/WEB-INF/jsp/front/shop/Shopscart.jsp";
    }
    
  //加入購物車
    @PostMapping("/Shopproduct/updateQuan")
    public ResponseEntity<String> updateQuan(@RequestBody  List<Quanproduct> Quanproduct){
        try {
            // 遍历所有商品信息，处理库存更新逻辑
            for (Quanproduct product : Quanproduct) {
                int productId = product.getProductId();
                String size = (product.getSize()+ "Size" );
                int quantity = product.getQuantity();
                List<ShopQuantityBean> shopList = shopQuanService.findById(productId);
                ShopQuantityBean shopQuan = shopList.get(0);
                switch (size) {
				case "xsSize":
					Integer newShopXs = shopQuan.getXsSize() - quantity;
					shopQuan.setsSize(newShopXs);
					shopQuanService.update(shopQuan);
					break;
				case "sSize":
					Integer newShops = shopQuan.getsSize() - quantity;
					shopQuan.setsSize(newShops);
					shopQuanService.update(shopQuan);
					break;
		        case "mSize":
		            Integer newShopM = shopQuan.getmSize() - quantity;
		            shopQuan.setmSize(newShopM);
		            shopQuanService.update(shopQuan);
		            break;
		        case "lSize":
		            Integer newShopL = shopQuan.getlSize() - quantity;
		            shopQuan.setlSize(newShopL);
		            shopQuanService.update(shopQuan);
		            break;
		        case "xlSize":
		            Integer newShopXl = shopQuan.getXlSize() - quantity;
		            shopQuan.setXlSize(newShopXl);
		            shopQuanService.update(shopQuan);
		            break;
				default:
					break;
				}
            }
            return ResponseEntity.ok("ok");
        } catch (Exception e) {
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("庫存更新失敗");
        }
	}
    
    @GetMapping("/clearSession")
    public ResponseEntity<String> clearSession(HttpSession session) {
        // 清空Session
        session.invalidate();
        return ResponseEntity.ok("Session cleared");
    }
    
    @PostMapping("/Shopproduct/removeCartItem")
    public ResponseEntity<String> removeCartItem(@RequestParam Integer index, HttpSession session) {
    	List<ShopcartBean> productList = (List<ShopcartBean>) session.getAttribute("productData");
    	System.out.println(productList);
    	System.out.println(index);
    	
    	Iterator<ShopcartBean> iterator = productList.iterator();
    	int currentIndex = 0;
    	while (iterator.hasNext()) {
    	    ShopcartBean product = iterator.next();
    	    if (currentIndex == index) {
    	        iterator.remove(); // 删除当前迭代到的元素
    	    }
    	    currentIndex++;
    	}
    	session.setAttribute("productData", productList);
        // 返回成功或失败的消息
    	return ResponseEntity.ok("ok");
    }
    

}