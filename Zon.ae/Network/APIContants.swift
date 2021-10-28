
//
//  APIConstants.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 07/05/2021.
//

import Foundation

internal struct APIConstants {
    
    // MARK: Live Credentials
    
    /*
     static let BasePath = "https://v1.zon.ae/api/"
     static let zonWebsiteURL = "https://www.zon.ae/"
     static let BasePathDeepLink = "[Deep Linking URL]"
     static let googleMapApiKey = ""
     static let gmailClientApi = ""
     static let liveChatLicenseId = "11582093"
     static let liveChatGroupId = "22"
     */
    
    
    // MARK:- Test Credentials
    static let BasePath = "https://beta.zon.ae/api/"
    static let zonWebsiteURL = "https://www.zon.ae/"
    static let BasePathDeepLink = "[Deep Linking URL]"
    static let googleMapApiKey = "AIzaSyDZqljDgBGeAFzDE5PV1udfTCW38LCJNss"
    static let gmailClientApi = "575538012847-6s8b15ds62a8fc2el1aq10ruhhck31ds.apps.googleusercontent.com"
    static let liveChatLicenseId = "11582093"
    static let liveChatGroupId = "22"
   
}

internal struct APIPaths {
    
    // MARK: Auth Module API Paths
    
    static let login                    = "login"
    static let signUp                   = "signupCustomer"
    static let ForgotPass               = "forgetPassword"
    static let verifyPhoneCode          = "verifyCode"
    static let checkForgotCode          = "checkForgotCode"
    
    static let home                     = "home"
    
    static let resendCode               = "resendCode"
    static let getPrimaryAddress        = "getPrimaryAddress"
    static let addAddress               = "addAddress"
    static let getAddress               = "getAddress"
    static let getArea                  = "getArea"
    static let deleteAddress            = "deleteAddress"
    static let editProfile              = "editProfile"
    static let getWishlist              = "getWishlist"
    static let getNotifications         = "getNotifications"
    static let getProfile               = "getProfile"
    static let ordersHistory            = "ordersHistory"
    static let updatePassword           =  "updatePassword"
    static let savePassword             =  "savePassword"
    
    static let faqs                     =  "faqs"
    static let submitIssue              =  "submitIssue"
    static let requestCall              =  "requestCall"
    static let getOfferCategories       =  "getOfferCategories"
    static let getLatestOffers          =  "getLatestOffers"
    static let getLatestOffersDetail    =  "getLatestOffersDetail"
    static let updateWishListStatus     =  "updateWishListStatus"
    static let addItemToWishlist        =  "addItemToWishlist"
    static let getImages                = "getImages"
    static let getImageDetail           =  "getImageDetail"
    static let getSearch                = "search"
    
    static let getProductCategory       = "getProductCategory"
    static let getCategory              = "getCategory"
    static let addOrder                 = "addOrder"
    static let getOffers                = "getOffers"
    static let deleteOrder              = "deleteOrder"
    static let getOfferDetail           = "getOfferDetail"
    //    static let getOrderListing = "getOrderListing"
    static let getOrderListing          = "getOrdersList"
    
    static let acceptOffer              = "acceptOffer"
    static let getOrderProducts         = "getOrderProducts"
    static let requestImages            = "requestImages"
    static let uploadImage              = "uploadImage"
    static let getTotalCount            =  "getTotalCount"
    static let savePhoneNo              =  "savePhoneNo"
    static let getPhoneNoChangeCode     =  "getPhoneNoChangeCode"
    static let AddFeeback               =  "addFeedback"
    static let getVersion               =  "getVersion"
    static let getCountriesList         = "getCountriesList"
    static let logout                   =  "logout"
    static let getLanguageStrings       = "getLanguageStrings"
    static let updateCountryLanguage    = "updateCountryLanguage"
    
}
