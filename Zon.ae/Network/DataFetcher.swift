//  DataFetcher.swift
//  DataFetcher.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 18/09/2021.
//

import Foundation

/*
 cosmetics
 device
 grocery

 iphone_12

 
 
 */

class DataFetcher {
    //Mark: Variables
    
    //MARK: Category List API Request
    static func invokeCategoryListAPIReuest(with handler: @escaping (_ categories: [Category]?, _ error: Error?) -> Void) {
        
        let categoriesData : [Category] = [
            Category(categoryId: 1, categoryName: "GROCERY", categoryIconImage: "grocery", categoryIconImageOVColor: "83DFC6", storeCountUnderCategory: 120),
            Category(categoryId: 2, categoryName: "ELECTRONICS", categoryIconImage: "device", categoryIconImageOVColor: "B1BEFF", storeCountUnderCategory: 1347),
            Category(categoryId: 3, categoryName: "COSMETICS", categoryIconImage: "cosmetics", categoryIconImageOVColor: "F0AE62", storeCountUnderCategory: 90),
            Category(categoryId: 4, categoryName: "ELECTRONICS", categoryIconImage: "device", categoryIconImageOVColor: "E7ABE9", storeCountUnderCategory: 234),
            Category(categoryId: 5, categoryName: "GROCERY", categoryIconImage: "grocery", categoryIconImageOVColor: "B1BEFF", storeCountUnderCategory: 10),
            Category(categoryId: 6, categoryName: "COSMETICS", categoryIconImage: "cosmetics", categoryIconImageOVColor: "E7ABE9", storeCountUnderCategory: 643),
              
        ]
        
        handler(categoriesData, nil)
    }
    
    
    //MARK: User API Request
    static func invokeUserAPIReuest(with handler: @escaping (_ user: User?, _ error: Error?) -> Void) {
        
        let recentOrdersData : [Order] = [
            Order(productId: 1, productName: "3 x Apple iPhone 12 Pro White", productImage: "iphone_12", productTransitRemainingTime: "About 2 hours", productCurrentTransitStatus: .OrderShipped),
            Order(productId: 2, productName: "3 x Apple iPhone 12 Pro White", productImage: "iphone_12", productTransitRemainingTime: "About 2 hours", productCurrentTransitStatus: .OrderShipped),
            Order(productId: 3, productName: "3 x Apple iPhone 12 Pro White", productImage: "iphone_12", productTransitRemainingTime: "About 2 hours", productCurrentTransitStatus: .OrderShipped),
            Order(productId: 4, productName: "3 x Apple iPhone 12 Pro White", productImage: "iphone_12", productTransitRemainingTime: "About 2 hours", productCurrentTransitStatus: .OrderShipped),
            Order(productId: 5, productName: "3 x Apple iPhone 12 Pro White", productImage: "iphone_12", productTransitRemainingTime: "About 2 hours", productCurrentTransitStatus: .OrderShipped),
            
        ]
        
        let user = User(userId: 0, orders: recentOrdersData, userFirstName: "Sobhan", userLastName: "Asim")
        
        handler(user, nil)
    }
    
    
    
    
    
}
