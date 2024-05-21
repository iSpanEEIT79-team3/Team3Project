package com.mmmooonnn.model;

public class Quanproduct {
	private int productId;
    private String size;
    private int quantity;

    // 构造函数
    public Quanproduct() {
    }

    // Getter 和 Setter 方法
    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
