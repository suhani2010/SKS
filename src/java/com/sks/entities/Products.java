
package com.sks.entities;

import java.sql.Timestamp;




public class Products {
    
    private int pid;
    private String pTitle;
    private String pDesc;
    private String pPhoto;
    private int pPrice;
    private int pDiscount;
    private int pQuantity;
    private Timestamp pDate;
    private int catId;
    private int pdiscountedPrice;

    public Products(int pid, String pTitle, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity, Timestamp pDate, int catId) {
        this.pid = pid;
        this.pTitle = pTitle;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.pDate = pDate;
        this.catId = catId;
    }

    public Products() {
    }

    public Products(String pTitle, String pDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity, Timestamp pDate, int catId) {
        this.pTitle = pTitle;
        this.pDesc = pDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.pDate = pDate;
        this.catId = catId;
    }

    public int getPid() {
        return pid;
    }

    

    public void setPid(int pid) {
        this.pid = pid;
    }

    public String getpTitle() {
        return pTitle;
    }

    public void setpTitle(String pTitle) {
        this.pTitle = pTitle;
    }

    public String getpDesc() {
        return pDesc;
    }

    public void setpDesc(String pDesc) {
        this.pDesc = pDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Timestamp getpDate() {
        return pDate;
    }

    public void setpDate(Timestamp pDate) {
        this.pDate = pDate;
    }

    public int getCatId() {
        return catId;
    }

    public void setCatId(int catId) {
        this.catId = catId;
    }
    public int getPdiscountedPrice() {
        pdiscountedPrice=pPrice-((pPrice*pDiscount)/100);
        return pdiscountedPrice;
    }
    
    
}
