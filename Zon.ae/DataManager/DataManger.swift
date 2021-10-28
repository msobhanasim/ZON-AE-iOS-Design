//
//  DataManger.swift
//  Clout
//
//  Created by user on 10/12/2019.
//  Copyright © 2019 CP. All rights reserved.
//


import UIKit
import MapKit

class DataManager: NSObject {
    
    var deviceToken: String = UIDevice.current.identifierForVendor!.uuidString
    
    static var isPremium: Bool = false
    
    static let sharedInstance = DataManager()
    
    var notificationCount: Int{
        set{
            UserDefaults.standard.set(newValue , forKey: "notificationscount")
        }
        get{
            return Int(UserDefaults.standard.integer(forKey: "notificationscount"))
        }
    }
    
    var CurrentAppTheme : ThemeMode  {
        set{
            UserDefaults.standard.set( newValue.rawValue, forKey: "CurrentAppTheme")
        }
        get{
            return ThemeMode(rawValue: UserDefaults.standard.string(forKey: "CurrentAppTheme") ?? ThemeMode.light.rawValue) ?? ThemeMode.light
        }
    }
    
    var spotifyLinked: Bool {
        set{
            UserDefaults.standard.set(newValue , forKey: "spotifyLinked")
        }
        get{
           return UserDefaults.standard.bool(forKey: "spotifyLinked")
        }
    }
    
    var didUpdateProfile : Bool  {
        set{
            UserDefaults.standard.set(newValue , forKey: "didUpdateProfile")
        }
        get{
           return UserDefaults.standard.bool(forKey: "didUpdateProfile")
        }
    }
    
    var didClearNotification : Bool  {
        set{
            UserDefaults.standard.set(newValue , forKey: "didClearNotification")
        }
        get{
           return UserDefaults.standard.bool(forKey: "didClearNotification")
        }
    }
    
    var user: User?{
        set{
            if let user = newValue{
                self.saveUserPermanentally(user)
            }
        }
        get{
            self.getPermanentlySavedUser()
        }
    }
    
    var loggedIn: Bool{
        set{
            UserDefaults.standard.set(newValue, forKey: "loggedIn")
        }
        get{
            return UserDefaults.standard.bool(forKey: "loggedIn")
        }
    }
    
    var user_top_genre: String{
        set{
            UserDefaults.standard.set(newValue, forKey: "user_top_genre")
        }
        get{
            return UserDefaults.standard.string(forKey: "user_top_genre") ?? ""
        }
    }
    
    var user_created_playlists: Int{
        set{
            UserDefaults.standard.set(newValue, forKey: "user_created_playlists")
        }
        get{
            return UserDefaults.standard.integer(forKey: "user_created_playlists")
        }
    }
    
    var user_joined_playlists: Int{
        set{
            UserDefaults.standard.set(newValue, forKey: "user_joined_playlists")
        }
        get{
            return UserDefaults.standard.integer(forKey: "user_joined_playlists")
        }
    }
    
    
    func saveUserPermanentally(_ item: User) {
        if item.id != nil {
            let encodedData = try? JSONEncoder().encode(item)
            UserDefaults.standard.set(encodedData, forKey: "user")
        }
    }
    
    
    func saveAccessTokenPermanentally(_ item:String) {
        UserDefaults.standard.set(item, forKey: "accessToken")
    }
    
    func getAccessTokenPermanentally() -> String {
        return UserDefaults.standard.string(forKey: "accessToken") ?? ""
    }
    
    func getPermanentlySavedUser() -> User? {
        if let data = UserDefaults.standard.data(forKey: "user"), let userData = try? JSONDecoder().decode(User.self, from: data) {
            return userData
        } else {
            return nil
        }
    }
   
    func isSetupComplete() -> Bool {
        return UserDefaults.standard.bool(forKey: "is_remember")
    }
    
    func setupComplete(remember : Bool) {
        UserDefaults.standard.set(remember, forKey: "is_remember")
        UserDefaults.standard.synchronize()
    }
   
//    func resetDefaults() {
//
//        let defaults = UserDefaults.standard
//        let dictionary = defaults.dictionaryRepresentation()
//        dictionary.keys.forEach { key in
//            defaults.removeObject(forKey: key)
//        }
//
//        PersistenceManager.startTime = Date()
//        PersistenceManager.saveAccessToken(accessToken: "")
//        PersistenceManager.saveRefreshToken(refreshToken: "")
//
//        spotifyManager.deauthorize()
//
//        DataManager.sharedInstance.oldLiveMember = Member()
//
//        DataManager.sharedInstance.liveMembers.removeAll()
//        DataManager.sharedInstance.oldLiveMembers.removeAll()
//        DataManager.sharedInstance.initialCollectiveItems.removeAll()
//
//        DataManager.sharedInstance.partyJoinedOrSatarted = false
//
//        self.saveUserPermanentally(User())
//
//        DataManager.globalTimer?.invalidate()
//
//        DataManager.sharedInstance.collectiveSongs = []
//        DataManager.sharedInstance.currentPlaying = nil
//        DataManager.sharedInstance.hasFetchedFromSpotify = false
//
//        DataManager.sharedInstance.user_top_genre = ""
//        DataManager.sharedInstance.user_joined_playlists = 0
//        DataManager.sharedInstance.user_created_playlists = 0
//
//        OneSignal.deleteTags(["user_id",
//                              "user_name",
//                              "device_type"])
//
//        IOSocket.sharedInstance.disconnect()
//
//        print("Timer Disabled")
//
//    }

}
