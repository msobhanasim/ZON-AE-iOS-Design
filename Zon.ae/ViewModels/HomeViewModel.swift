//
//  HomeViewModel.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 18/09/2021.
//

import Foundation


final class HomeViewModel: NSObject{
    
    var user: User?
    
    var categories: [Category] = []
    
    func getNumberOfCategories() -> Int {
        return categories.count
    }
    
    func getNumberOfOrders() -> Int {
        return user?.orders?.count ?? 0
    }
    
    func getCurrentUser() -> User? {
        return user
    }
    
    override init() {
        
    }
    
    init(user: User?, categories: [Category]) {
        if let user = user {
            self.user = user
        }
        
        self.categories = categories
    }
    
    
    func getUserData(with handler: @escaping (_ user: User?, _ error: Error?) -> Void){
        
        DataFetcher.invokeUserAPIReuest { userObj, error in
            if let error = error {
                handler(nil, error)
            } else if let user = userObj {
                handler(user, nil)
            }
        }
    }
    
    func getCategoriesData(with handler: @escaping (_ categories: [Category]?, _ error: Error?) -> Void){
        DataFetcher.invokeCategoryListAPIReuest(with: { categoriesList, error in
            if let error = error {
                handler(nil, error)
            } else if let categories = categoriesList {
                handler(categories, nil)
            }
        })
    }
    
    func getOrderItemAtIndexPath(indexPath: IndexPath) -> Order? {
        return self.user?.orders?[indexPath.row]
    }
    
    func getCategoryItemAtIndexPath(indexPath: IndexPath) -> Category {
        return self.categories[indexPath.item]
    }
    
}
