package com.mmmooonnn.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.antlr.v4.runtime.misc.TestRig;
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

import com.mmmooonnn.model.ShopBean;
import com.mmmooonnn.model.ShopQuantityBean;
import com.mmmooonnn.model.ShopQuantityRepository;
import com.mmmooonnn.service.ShopQuantityService;


@RestController
public class ShopQuantityController {
	
	@Autowired
	private ShopQuantityService shopQuanService;
	
//搜尋全部
	@GetMapping("/getAllQuan")
	public String getAllQuan(Model model) {
		List<ShopQuantityBean> shops = shopQuanService.findAll();
        model.addAttribute("shops", shops);
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
	}
//TestFunction
	@GetMapping("/getAllQuanTest")
	public List<ShopQuantityBean> getAllQuanTest(Model model) {
		List<ShopQuantityBean> shops = shopQuanService.findAll();
		return shops;
	}
	
//用id搜尋
    @PostMapping("/findQuanByproductid")
    public String FindQuanById(Model model,@RequestParam(value = "productid", required = false) Integer productid) {
    	List<ShopQuantityBean> shops = shopQuanService.findById(productid);
        model.addAttribute("shops", shops);
        return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    	}
//TestFunction
    @PostMapping("/findQuanByproductidTest/{productid}")
    public List<ShopQuantityBean> FindQuanByIdTest(Model model,@PathVariable(value = "productid", required = false) Integer productid) {
    	List<ShopQuantityBean> shops = shopQuanService.findById(productid);
    	return shops;
    	}

//刪除	
    @DeleteMapping("/deleteQuan/{productid}")
    public String delQuan(@PathVariable Integer productid) {
    	shopQuanService.deleteById(productid); 
    	return "forward:/WEB-INF/jsp/GetAllShops.jsp";
    }
//TestFunction	
    @DeleteMapping("/deleteQuanTest/{productid}")
    public String delQuanTest(@PathVariable Integer productid) {
    	shopQuanService.deleteById(productid); 
    		return "刪除成功:" + productid;
    }

//增
	@PostMapping("/addShopQuan")
	public String addShopQuan(Model model,
		                      @RequestParam(value="productId", required=true) Integer productId,
		                      @RequestParam(value="xsSize", required=true) Integer xsSize,
		                      @RequestParam(value="sSize", required=true) Integer sSize,
		                      @RequestParam(value="mSize", required=true) Integer mSize,
		                      @RequestParam(value="lSize", required=true) Integer lSize,
		                      @RequestParam(value="xlSize", required=true) Integer xlSize) {
		ShopQuantityBean newShop = new ShopQuantityBean();
	    newShop.setProductId(productId);
	    newShop.setXsSize(xsSize);
	    newShop.setsSize(sSize);
	    newShop.setmSize(mSize);
	    newShop.setlSize(lSize);
	    newShop.setXlSize(xlSize);
	    
	    shopQuanService.insert(newShop);
	    
	    return "forward:/WEB-INF/jsp/GetAllShops.jsp";
	} 
//TestFunction  
	
	
//改
    @PutMapping("/update")
    public ResponseEntity<String> updateShop(Model model,
								            @RequestParam(value="productId", required=true) Integer productId,
								            @RequestParam(value="xsSize", required=true) Integer xsSize,
								            @RequestParam(value="sSize", required=true) Integer sSize,
								            @RequestParam(value="mSize", required=true) Integer mSize,
								            @RequestParam(value="lSize", required=true) Integer lSize,
								            @RequestParam(value="xlSize", required=true) Integer xlSize) {
    	List<ShopQuantityBean> shopList = shopQuanService.findById(productId); //找該no的數據 回傳過來的是list<shop> 再抓取list第1筆資料
    	ShopQuantityBean newShop = shopList.get(0);
        if (newShop != null) {
            //更新商品
    	    newShop.setProductId(productId);
    	    newShop.setXsSize(xsSize);
    	    newShop.setsSize(sSize);
    	    newShop.setmSize(mSize);
    	    newShop.setlSize(lSize);
    	    newShop.setXlSize(xlSize);
            //保存更新後的訊息
            shopQuanService.update(newShop);
            return ResponseEntity.ok("更新成功");
    }else {
        // 如果未找到商品，返回相应的状态码和消息
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body("未找到商品");
    }
}
//TestFunction  

    
    
    
    
	
}
