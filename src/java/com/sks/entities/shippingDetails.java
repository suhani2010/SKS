
package com.sks.entities;


public class shippingDetails {
    private String address;
    private String contact;
    private String id;
    private String userName;

   

    public shippingDetails(String userId, String userName, String userAddress, String userContact) {
        this.address=userAddress;
        this.contact=userContact;
        this.id=userId;
        this.userName=userName;
    }

   

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
    
    
}
