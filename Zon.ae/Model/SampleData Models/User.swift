//
//  User.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 18/09/2021.
//

import UIKit
import Foundation
import SwiftyJSON
import GoogleSignIn
import SwiftyJSON
import AuthenticationServices

//struct User: Codable {
//    var userId: Int?
//    var orders: [Order]?
//    var userFirstName: String?
//    var userLastName: String?
//}

class User : Codable , NSCoding {
    func encode(with acoder: NSCoder) {
        
        acoder.encode(self.id                   , forKey: "id")
        acoder.encode(self.firstName            , forKey: "firstName")
        acoder.encode(self.lastName             , forKey: "lastName")
        acoder.encode(self.email                , forKey: "email")
        acoder.encode(self.phoneNumber          , forKey: "phoneNumber")
        acoder.encode(self.gender               , forKey: "gender")
        acoder.encode(self.interestedIn         , forKey: "interestedIn")
        acoder.encode(self.lat                  , forKey: "lat")
        acoder.encode(self.lng                  , forKey: "lng")
        acoder.encode(self.address              , forKey: "address")
        acoder.encode(self.isVerified           , forKey: "isVerified")
        acoder.encode(self.about                , forKey: "about")
        acoder.encode(self.date_of_birth        , forKey: "date_of_birth")
        acoder.encode(self.smokingId            , forKey: "smokingId")
        acoder.encode(self.drinkingId           , forKey: "drinkingId")
        acoder.encode(self.educationId          , forKey: "educationId")
        acoder.encode(self.religionId           , forKey: "religionId")
        acoder.encode(self.lookingForId         , forKey: "lookingForId")
        acoder.encode(self.starSignIn           , forKey: "starSignIn")
        acoder.encode(self.profilePhoto         , forKey: "profilePhoto")
        acoder.encode(self.height               , forKey: "height")
        acoder.encode(self.instagramLink        , forKey: "instagramLink")
        acoder.encode(self.spotifyLink          , forKey: "spotifyLink")
        acoder.encode(self.socialId             , forKey: "socialId")
        acoder.encode(self.socialType           , forKey: "socialType")
        acoder.encode(self.emailVerifiedAt      , forKey: "emailVerifiedAt")
        acoder.encode(self.created_at           , forKey: "created_at")
        acoder.encode(self.updated_at           , forKey: "updated_at")
        acoder.encode(self.age                  , forKey: "age")
        acoder.encode(self.userDistance         , forKey: "userDistance")
        acoder.encode(self.access_token         , forKey: "access_token")
        acoder.encode(self.username             , forKey: "username")
        acoder.encode(self.education            , forKey: "education")
        acoder.encode(self.occupation           , forKey: "occupation")
        acoder.encode(self.occupation           , forKey: "occupation")
        acoder.encode(self.instagramImages      , forKey: "instagramImages")
        acoder.encode(self.instagram_token      , forKey: "instagram_token")
        acoder.encode(self.subscriptions        , forKey: "subscriptions")
        acoder.encode(self.notification_setting , forKey: "notification_setting")
        acoder.encode(self.from_insta           , forKey: "from_insta")
        acoder.encode(self.is_premium           , forKey: "is_premium")
        acoder.encode(self.user_like            , forKey: "user_like")
        acoder.encode(self.is_hide              , forKey: "is_hide")
        acoder.encode(self.is_free              , forKey: "is_free")
        acoder.encode(self.isVerified           , forKey: "is_verified")
        acoder.encode(self.verify_photo         , forKey: "verify_photo")
        acoder.encode(self.coupon_code          , forKey: "coupon_code")
        acoder.encode(self.enneagram_type_id    , forKey: "enneagram_type_id")
        acoder.encode(self.total_count          , forKey: "total_count")
        acoder.encode(self.remaining_count      , forKey: "remaining_count")
        acoder.encode(self.enneagram_name       , forKey: "enneagram_name")
        acoder.encode(self.short_address       , forKey: "short_address")
        

    }
    
    
    required convenience init?(coder decoder: NSCoder) {
        
        self.init()
        self.id                     = decoder.decodeInteger(forKey: "id")
        self.firstName              = decoder.decodeObject(forKey: "firstName") as? String
        self.lastName               = decoder.decodeObject(forKey: "lastName") as? String
        self.email                  = decoder.decodeObject(forKey: "email") as? String
        self.phoneNumber            = decoder.decodeObject(forKey: "phoneNumber") as? String
        self.gender                 = decoder.decodeObject(forKey: "gender") as? String
        self.interestedIn           = decoder.decodeObject(forKey: "interestedIn") as? String
        self.lat                    = decoder.decodeObject(forKey: "lat") as? String
        self.lng                    = decoder.decodeObject(forKey: "lng") as? String
        self.address                = decoder.decodeObject(forKey: "address") as? String
        self.isVerified             = (decoder.decodeInteger(forKey: "isVerified") == 1)
        self.about                  = decoder.decodeObject(forKey: "about") as? String
        self.date_of_birth          = decoder.decodeObject(forKey: "date_of_birth") as? String
        self.smokingId              = decoder.decodeObject(forKey: "smokingId") as? Int
        self.drinkingId             = decoder.decodeObject(forKey: "drinkingId") as? Int
        self.educationId            = decoder.decodeObject(forKey: "educationId") as? Int
        self.religionId             = decoder.decodeObject(forKey: "religionId") as? Int
        self.lookingForId           = decoder.decodeObject(forKey: "lookingForId") as? Int
        self.starSignIn             = decoder.decodeObject(forKey: "starSignIn") as? Int
        self.profilePhoto           = decoder.decodeObject(forKey: "profilePhoto") as? String
        self.height                 = decoder.decodeObject(forKey: "height") as? String
        self.instagramLink          = decoder.decodeObject(forKey: "instagramLink") as? String
        self.spotifyLink            = decoder.decodeObject(forKey: "spotifyLink") as? String
        self.socialId               = decoder.decodeObject(forKey: "socialId") as? String
        self.socialType             = decoder.decodeObject(forKey: "socialType") as? String
        self.created_at             = decoder.decodeObject(forKey: "created_at") as? String
        self.updated_at             = decoder.decodeObject(forKey: "updated_at") as? String
        self.age                    = decoder.decodeInteger(forKey: "age")
        self.userDistance           = decoder.decodeObject(forKey: "userDistance") as? String
        self.emailVerifiedAt        = decoder.decodeObject(forKey: "emailVerifiedAt") as? String
        self.access_token           = decoder.decodeObject(forKey: "access_token") as? String
        self.username               = decoder.decodeObject(forKey: "username") as? String
        self.education              = decoder.decodeObject(forKey: "education") as? Education
        self.occupation             = decoder.decodeObject(forKey: "occupation") as? Occupation
        //        self.podcasts               = decoder.decodeObject(forKey: "podcasts") as? [Podcast] ?? []
        self.instagramImages        = decoder.decodeObject(forKey: "instagramImages") as? InstagramData
        self.instagram_token        = decoder.decodeObject(forKey: "instagram_token") as? String
        self.subscriptions          = decoder.decodeObject(forKey: "subscriptions") as? [Subscription] ?? []
        self.notification_setting   = decoder.decodeObject(forKey: "notification_setting") as? NotificationSetting
        self.from_insta             = (decoder.decodeInteger(forKey: "from_insta") == 1)
        self.is_premium             = (decoder.decodeInteger(forKey: "is_premium") == 1)
        self.user_like              = decoder.decodeInteger(forKey: "user_like")
        self.is_hide                = (decoder.decodeInteger(forKey: "is_hide") == 1)
        self.is_free                = decoder.decodeInteger(forKey: "is_free")
        self.verify_photo           = decoder.decodeObject(forKey: "verify_photo") as? VerifyPhoto
        self.coupon_code            = decoder.decodeObject(forKey: "coupon_code") as? String
        self.enneagram_type_id      = decoder.decodeInteger(forKey: "enneagram_type_id")
        self.total_count            = decoder.decodeInteger(forKey: "total_count")
        self.remaining_count        = decoder.decodeInteger(forKey: "remaining_count")
        self.enneagram_name         = decoder.decodeObject(forKey: "enneagram_name") as? String
        self.short_address          = decoder.decodeObject(forKey: "short_address") as? String
    }
    
    init(){}
    
    init(userId: Int, orders: [Order], userFirstName: String, userLastName: String) {
        self.id = userId
        self.orders = orders
        self.firstName = userFirstName
        self.lastName = userLastName
    }
    
    
    var id                          : Int = 0
    var firstName                   : String? = ""
    var lastName                    : String? = ""
    var email                       : String? = ""
    var phoneNumber                 : String? = ""
    var gender                      : String? = ""
    var interestedIn                : String? = ""
    var orders                      : [Order]? /// `Temp Added`
    var lat                         : String? = ""
    var lng                         : String? = ""
    var address                     : String? = ""
    var isVerified                  : Bool = false
    var about                       : String? = "No About Description Available"
    var date_of_birth               : String? = ""
    var smokingId                   : Int?
    var drinkingId                  : Int?
    var educationId                 : Int?
    var religionId                  : Int?
    var lookingForId                : Int?
    var starSignIn                  : Int?
    var profilePhoto                : String? = ""
    var height                      : String? = ""
    var instagramLink               : String? = ""
    var spotifyLink                 : String? = ""
    var socialId                    : String? = ""
    var socialType                  : String? = ""
    var emailVerifiedAt             : String? = ""
    var created_at                  : String? = ""
    var updated_at                  : String? = ""
    var age                         : Int? = 0
    var userDistance                : String? = ""
    var access_token                : String? = ""
    var username                    : String? = ""
    var medias                      : [UserMedia] = []
    var education                   : Education?
    var occupation                  : Occupation?
    //    var podcasts                    : [Podcast] = []
    var instagramImages             : InstagramData? = InstagramData()
    var instagram_token             : String? = ""
    var subscriptions               : [Subscription] = []
    var notification_setting        : NotificationSetting? = NotificationSetting()
    var from_insta                  : Bool = false
    var is_premium                  : Bool = false
    var user_like                   : Int  = 0
    var is_hide                     : Bool = false
    var is_free                     : Int = 0
    
    var verify_photo                : VerifyPhoto? = nil
    var coupon_code                 : String? = ""
    var enneagram_type_id           : Int?
    var total_count                 : Int?
    var remaining_count             : Int?
    var enneagram_name              : String?
    var short_address               : String?
    
    func initUserFrom(json : [String : Any]) -> User {
        let user = User()
        
        user.id =  json["id"] as? Int ?? 0
        user.firstName = json["first_name"] as? String ?? ""
        user.lastName = json["last_name"] as? String ?? ""
        user.email = json["email"] as? String ?? ""
        user.phoneNumber = json["phone"] as? String ?? ""
        user.gender = json["gender"] as? String ?? ""
        user.interestedIn = json["interested_in"] as? String ?? ""
        user.lat = json["lat"] as? String ?? ""
        user.lng = json["lng"] as? String ?? ""
        user.address = json["address"] as? String ?? ""
        user.isVerified = json["is_verified"] as? Bool ?? false
        user.about = json["about"] as? String ?? "No About Description Available"
        user.date_of_birth = json["date_of_birth"] as? String ?? ""
        user.height = json["height"] as? String ?? ""
        user.instagramLink = json["instagram_link"] as? String ?? ""
        user.spotifyLink = json["spotify_link"] as? String ?? ""
        user.socialId = json["social_id"] as? String ?? ""
        user.socialType = json["social_type"] as? String ?? ""
        user.emailVerifiedAt = json["email_verified_at"] as? String ?? ""
        user.created_at = json["created_at"] as? String ?? ""
        user.updated_at = json["updated_at"] as? String ?? ""
        user.age = json["age"] as? Int
        user.smokingId = json["smoking_id"] as? Int
        user.userDistance = json["user_distance"] as? String ?? ""
        user.access_token = json["access_token"] as? String ?? ""
        user.instagram_token = json["instagram_token"] as? String ?? ""
        user.is_hide = (json["is_hide"] as? Int ?? 0) == 1
        user.from_insta = (json["from_insta"] as? Int ?? 0) == 1
        user.is_premium = (json["is_premium"] as? Int ?? 0) == 1
        user.user_like  = (json["other_user_like"] as? Int ?? 0)
        user.coupon_code = json["coupon_code"] as? String
        user.enneagram_type_id = json["enneagram_type_id"] as? Int
        user.total_count = json["total_count"] as? Int
        user.remaining_count = json["remaining_count"] as? Int
        user.is_free = json["is_free"] as? Int ?? 0
        user.profilePhoto = APIConstants.BasePath + (json["profile_photo"] as? String ?? "")
        user.enneagram_name = json["enneagram_name"] as? String ?? ""
        user.access_token = json["access_token"] as? String ?? ""
        user.short_address = json["short_address"] as? String ?? ""
        if user.id != DataManager.sharedInstance.user?.id{
            user.profilePhoto = APIConstants.BasePath + (json["profile_photo"] as? String ?? "")
        }
        
        if let verifyPhoto = json["verify_photo"] as? [String:Any] {
            user.verify_photo = VerifyPhoto().initVerifyPhotoFrom(json: verifyPhoto)
        }
        
        if let drinkingId = json["drinking_id"] as? Int {
            user.drinkingId = drinkingId
        }
        
        if let educationId = json["education_id"] as? Int {
            user.educationId = educationId
        }
        
        if let religionId = json["religion_id"] as? Int {
            user.religionId = religionId
        }
        
        if let lookingForId = json["looking_for_id"] as? Int {
            user.lookingForId = lookingForId
        }
        
        if let starSignIn = json["star_sign_id"] as? Int {
            user.starSignIn = starSignIn
        }
        
        if let education = json["education"] as? [String:Any] {
            user.education = Education().initEducationFrom(json: education)
        }
        
        if let occupation = json["occupation"] as? [String:Any] {
            user.occupation = Occupation().initOccupationFrom(json: occupation)
        }
        
        if let subsciptionData = json["subscriptions"] as? [[String: Any]]{
            
            for subscription in subsciptionData{
                user.subscriptions.append(Subscription().initSubscriptionFrom(json: subscription))
            }
        }
        
        if let noti = json["notification_setting"]  as? [String:Any]{
            user.notification_setting = NotificationSetting().initSubscriptionFrom(json: noti)
            
        }
        
        if let media = json["images"] as? [[String:Any]] {
            
            user.medias.removeAll()
            
            for i in media{
                let singleMedia = UserMedia().initUserMediaFrom(json: i)
                singleMedia.type = .existing
                user.medias.append(singleMedia)
                
                if singleMedia.is_profile ?? false{
                    user.profilePhoto = singleMedia.imageLink
                }
            }
            
            let pic = UserMedia()
            pic.type = .new
            pic.is_profile = false
            user.medias.append(pic)
        }
        
        DataManager.sharedInstance.saveAccessTokenPermanentally(user.access_token ?? "")
        
        return user
        
    }
    func genrateUserFromGoogle(googleUser :  GIDGoogleUser?) -> User {
        let userObj = User()
        userObj.socialId =  googleUser!.userID
        userObj.username = googleUser!.profile.name
        userObj.firstName = googleUser?.profile.name
        userObj.lastName = googleUser?.profile.familyName
        userObj.email = googleUser!.profile.email
        userObj.profilePhoto = googleUser!.profile.imageURL(withDimension: 200)?.absoluteString
        return userObj
    }
    
    @available(iOS 13.0, *)
    func genrateUserFromApple(appleUser :  ASAuthorizationAppleIDCredential?) -> User {
        let userObj = User()
        let userIdentifier = appleUser!.user
        userObj.socialId = userIdentifier
        userObj.username = appleUser?.fullName?.givenName
        userObj.email = appleUser?.email
        userObj.profilePhoto = ""
        return userObj
    }
}

extension UIView {
    var currentUser: User {
        get{
            return DataManager.sharedInstance.getPermanentlySavedUser() ?? User()
        }
        set {
            DataManager.sharedInstance.saveUserPermanentally(newValue)
            
        }
    }
}

extension UIViewController {
    var currentUser: User {
        get{
            return DataManager.sharedInstance.getPermanentlySavedUser() ?? User()
        }
        set {
            
            if newValue.access_token ?? "" != ""{
                
            } else {
                let user = newValue
                user.access_token = DataManager.sharedInstance.getAccessTokenPermanentally()
                DataManager.sharedInstance.saveUserPermanentally(user)
            }
            
            DataManager.sharedInstance.saveUserPermanentally(newValue)
            
        }
    }
    
    var didPassedWalkthrough: Bool  {
        set{
            UserDefaults.standard.set(newValue , forKey: "didGotCompleteProfileOnHomeVC")
        }
        get{
           return UserDefaults.standard.bool(forKey: "didGotCompleteProfileOnHomeVC")
        }
    }
    
}

enum mediaType : String, Codable{
    
    case existing = "existing"
    case new      = "new"
}

class UserMedia : Codable , NSCoding{
    
    var id : Int? = 0
    var userId : Int? = 0
    var imageLink : String? = ""
    var from_insta : Bool = false
    var createdAt : String? = ""
    var updatedAt : String? = ""
    var is_profile: Bool? = false
    var type : mediaType = .existing
    
    func encode(with acoder: NSCoder) {
        acoder.encode(self.id            , forKey: "id")
        acoder.encode(self.userId        , forKey: "userId")
        acoder.encode(self.imageLink     , forKey: "imageLink")
        acoder.encode(self.createdAt     , forKey: "createdAt")
        acoder.encode(self.updatedAt     , forKey: "updatedAt")
        acoder.encode(self.is_profile    , forKey: "is_profile")
        acoder.encode(self.from_insta    , forKey: "from_insta")
    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        self.id                 = decoder.decodeInteger(forKey: "id")
        self.imageLink          = decoder.decodeObject(forKey: "imageLink") as? String
        self.createdAt          = decoder.decodeObject(forKey: "createdAt") as? String
        self.updatedAt          = decoder.decodeObject(forKey: "updatedAt") as? String
        self.userId             = decoder.decodeInteger(forKey: "userId")
        self.is_profile         = decoder.decodeObject(forKey: "is_profile") as? Bool
        self.from_insta         = (decoder.decodeInteger(forKey: "from_insta") == 1)
    }
    
    func initUserMediaFrom(json : [String: Any]) -> UserMedia{
        
        let professionalDetail = UserMedia()
        professionalDetail.id = json["id"] as? Int? ?? 0
        professionalDetail.userId = json["user_id"] as? Int? ?? 0
        professionalDetail.imageLink = json["media"] as? String ?? ""
        professionalDetail.createdAt = json["created_at"] as? String? ?? ""
        professionalDetail.updatedAt = json["updated_at"] as? String? ?? ""
        professionalDetail.from_insta = (json["from_insta"] as? Int? ?? 0) == 1
        professionalDetail.is_profile = json["is_profile"] as? Bool ?? false
        professionalDetail.imageLink = APIConstants.BasePath + (professionalDetail.imageLink ?? "")
        
        
        return professionalDetail
        
    }
    
}

class Education : Codable , NSCoding{
    var id: Int?
    var user_id: Int?
    var institute_name: String?
    var graduation_year: String?
    
    func encode(with acoder: NSCoder) {
        acoder.encode(self.id            , forKey: "id")
        acoder.encode(self.user_id        , forKey: "user_id")
        acoder.encode(self.institute_name     , forKey: "institute_name")
        acoder.encode(self.graduation_year     , forKey: "graduation_year")
    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        self.id                 = decoder.decodeInteger(forKey: "id")
        self.user_id            = decoder.decodeInteger(forKey: "id")
        self.institute_name     = decoder.decodeObject(forKey: "institute_name") as? String
        self.graduation_year    = decoder.decodeObject(forKey: "graduation_year") as? String
    }
    
    func initEducationFrom(json : [String: Any]) -> Education{
        
        let education = Education()
        education.id = json["id"] as? Int? ?? 0
        education.user_id = json["user_id"] as? Int? ?? 0
        education.institute_name = json["institute_name"] as? String ?? ""
        education.graduation_year = json["graduation_year"] as? String? ?? ""
        
        return education
        
    }
    
}

class Occupation : Codable , NSCoding{
    var id: Int?
    var user_id: Int?
    var title: String?
    var company_name: String?
    
    func encode(with acoder: NSCoder) {
        acoder.encode(self.id               , forKey: "id")
        acoder.encode(self.user_id          , forKey: "user_id")
        acoder.encode(self.title            , forKey: "title")
        acoder.encode(self.company_name     , forKey: "company_name")
    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        self.id           = decoder.decodeInteger(forKey: "id")
        self.user_id      = decoder.decodeInteger(forKey: "id")
        self.title        = decoder.decodeObject(forKey: "title") as? String
        self.company_name = decoder.decodeObject(forKey: "company_name") as? String
    }
    
    func initOccupationFrom(json : [String: Any]) -> Occupation {
        
        let occupation = Occupation()
        occupation.id = json["id"] as? Int? ?? 0
        occupation.user_id = json["user_id"] as? Int? ?? 0
        occupation.title = json["title"] as? String ?? ""
        occupation.company_name = json["company_name"] as? String? ?? ""
        
        return occupation
        
    }
    
}


class PodcastEpisode : Codable {
    
    var id              : Int? = 0
    var title           : String? = ""
    var audio_url       : String? = ""
    var artwork_url     : String? = ""
    var description     : String? = ""
    var summary         : String? = ""
    var artist          : String? = ""
    var tags            : String? = ""
    var published_at    : String? = ""
    var duration        : Int? = 0
    var hq              : Bool? = false
    var magic_mastering : Bool? = false
    var guid            : String? = ""
    var inactive_at     : Int? = 0
    var episode_number  : Int? = 0
    var season_number   : Int? = 0
    var explicit        : Bool? = false
    var private_flag    : Bool? = false
    var total_plays     : Int? = 0
    
    func initPodcastFrom(json : [String: Any]) -> PodcastEpisode{
        
        let episode = PodcastEpisode()
        episode.id              = json["id"] as? Int ?? 0
        episode.title           = json["title"] as? String ?? ""
        episode.audio_url       = json["audio_url"] as? String ?? ""
        episode.artwork_url     = json["artwork_url"] as? String ?? ""
        episode.description     = json["description"] as? String ?? ""
        episode.summary         = json["summary"] as? String ?? ""
        episode.artist          = json["artist"] as? String ?? ""
        episode.tags            = json["tags"] as? String ?? ""
        episode.published_at    = json["published_at"] as? String ?? ""
        episode.duration        = json["duration"] as? Int ?? 0
        episode.hq              = json["hq"] as? Bool ?? false
        episode.magic_mastering = json["magic_mastering"]  as? Bool ?? false
        episode.guid            = json["guid"] as? String ?? ""
        episode.inactive_at     = json["inactive_at"] as? Int ?? 0
        episode.episode_number  = json["episode_number"] as? Int ?? 0
        episode.season_number   = json["season_number"] as? Int ?? 0
        episode.explicit        = json["explicit"]  as? Bool ?? false
        episode.private_flag    = json["private"]  as? Bool ?? false
        episode.total_plays     = json["total_plays"] as? Int ?? 0
        
        return episode
        
    }
}

class InstagramData : Codable , NSCoding{
    var data = [InstagramImage]()
    
    func encode(with acoder: NSCoder) {
        acoder.encode(self.data           , forKey: "data")
    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        
        self.data    = decoder.decodeObject(forKey: "data") as? [InstagramImage] ?? []
    }
    
    func initInstagramDataFrom(json : [String: Any]) -> InstagramData{
        
        let data = InstagramData()
        
        if let instaData = json["data"] as? [[String: Any]]{
            data.data.removeAll()
            for singleData in instaData {
                let obj = InstagramImage().initInstagramImageFrom(json: singleData)
                data.data.append(obj)
            }
        }
        return data
    }
}

class InstagramImage : Codable , NSCoding{
    
    var id: String?
    var timestamp: String?
    var media_type: String?
    var username: String?
    var media_url: String?
    
    func encode(with acoder: NSCoder) {
        acoder.encode(self.id           , forKey: "id")
        acoder.encode(self.timestamp    , forKey: "timestamp")
        acoder.encode(self.media_type   , forKey: "media_type")
        acoder.encode(self.username     , forKey: "username")
        acoder.encode(self.media_url    , forKey: "media_url")
        
    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        
        self.id    = decoder.decodeObject(forKey: "id") as? String
        self.timestamp  = decoder.decodeObject(forKey: "timestamp") as? String
        self.media_type = decoder.decodeObject(forKey: "media_type") as? String
        self.username   = decoder.decodeObject(forKey: "username") as? String
        self.media_url  = decoder.decodeObject(forKey: "media_url") as? String
        
    }
    
    func initInstagramImageFrom(json : [String: Any]) -> InstagramImage{
        
        let image = InstagramImage()
        image.id = json["id"] as? String? ?? ""
        image.timestamp = json["timestamp"] as? String? ?? ""
        image.media_type = json["media_type"] as? String? ?? ""
        image.username = json["username"] as? String? ?? ""
        image.media_url = json["media_url"] as? String? ?? ""
        
        return image
        
    }
    
}


class Subscription : Codable , NSCoding{
    
    var id                  : Int? = 0
    var user_id             : Int? = 0
    var package_id          : Int? = 0
    var payment_id          : Int? = 0
    var price               : Float? = 0.0
    var start_date          : String? = ""
    var expiry_date         : String? = ""
    var status              : String? = ""
    var created_at          : String? = ""
    var updated_at          : String? = ""
    var subscription_token  : String? = ""
    var duration            : String? = ""
    var cancel_request      : Bool? = false
    
    func encode(with acoder: NSCoder) {
        
        acoder.encode(id                , forKey: "id")
        acoder.encode(user_id           , forKey: "user_id")
        acoder.encode(package_id        , forKey: "package_id")
        acoder.encode(payment_id        , forKey: "payment_id")
        acoder.encode(price             , forKey: "price")
        acoder.encode(start_date        , forKey: "start_date")
        acoder.encode(expiry_date       , forKey: "expiry_date")
        acoder.encode(status            , forKey: "status")
        acoder.encode(created_at        , forKey: "created_at")
        acoder.encode(updated_at        , forKey: "updated_at")
        acoder.encode(subscription_token, forKey: "subscription_token")
        acoder.encode(duration          , forKey: "duration")
        acoder.encode(cancel_request    , forKey: "cancel_request")
        
    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        
        self.id                 = decoder.decodeInteger(forKey: "id")
        self.user_id            = decoder.decodeInteger(forKey: "user_id")
        self.package_id         = decoder.decodeInteger(forKey: "package_id")
        self.payment_id         = decoder.decodeInteger(forKey: "payment_id")
        self.price              = decoder.decodeFloat(forKey: "price")
        self.start_date         = decoder.decodeObject(forKey: "start_date") as? String ?? ""
        self.expiry_date        = decoder.decodeObject(forKey: "expiry_date") as? String ?? ""
        self.status             = decoder.decodeObject(forKey: "status") as? String ?? ""
        self.created_at         = decoder.decodeObject(forKey: "created_at") as? String ?? ""
        self.updated_at         = decoder.decodeObject(forKey: "updated_at") as? String ?? ""
        self.subscription_token = decoder.decodeObject(forKey: "subscription_token") as? String ?? ""
        self.duration           = decoder.decodeObject(forKey: "duration") as? String ?? ""
        self.cancel_request     = (decoder.decodeInteger(forKey: "cancel_request")) == 1
    }
    
    func initSubscriptionFrom(json : [String: Any]) -> Subscription{
        
        let subscription = Subscription()
        
        subscription.id                 = json["id"] as? Int ?? 0
        subscription.user_id            = json["user_id"] as? Int ?? 0
        subscription.package_id         = json["package_id"] as? Int ?? 0
        subscription.payment_id         = json["payment_id"] as? Int ?? 0
        subscription.price              = json["price"] as? Float ?? 0.0
        subscription.start_date         = json["start_date"] as? String ?? ""
        subscription.expiry_date        = json["expiry_date"] as? String ?? ""
        subscription.status             = json["status"] as? String ?? ""
        subscription.created_at         = json["created_at"] as? String ?? ""
        subscription.updated_at         = json["updated_at"] as? String ?? ""
        subscription.subscription_token = json["subscription_token"] as? String ?? ""
        subscription.duration           = json["duration"] as? String ?? ""
        subscription.cancel_request     = (json["cancel_request"] as? Int ?? 0) == 1
        
        return subscription
        
    }
    
}


class NotificationSetting : Codable , NSCoding{
    
    var id                  : Int? = 0
    var user_id             : Bool? = false
    var msg_in_app          : Bool? = false
    var msg_push            : Bool? = false
    var match_in_app        : Bool? = false
    var match_push          : Bool? = false
    var exp_match_in_app    : Bool? = false
    var exp_match_push      : Bool? = false
    var like_in_app         : Bool? = false
    var like_push           : Bool? = false
    var created_at          : String? = ""
    var updated_at          : String? = ""
    
    func encode(with acoder: NSCoder) {
        
        acoder.encode(id                , forKey: "id")
        acoder.encode(user_id           , forKey: "user_id")
        acoder.encode(msg_in_app        , forKey: "msg_in_app")
        acoder.encode(msg_push          , forKey: "msg_push")
        acoder.encode(match_in_app      , forKey: "match_in_app")
        acoder.encode(match_push        , forKey: "match_push")
        acoder.encode(exp_match_in_app  , forKey: "exp_match_in_app")
        acoder.encode(exp_match_push    , forKey: "exp_match_push")
        acoder.encode(like_in_app       , forKey: "like_in_app")
        acoder.encode(like_push         , forKey: "like_push")
        acoder.encode(created_at        , forKey: "created_at")
        acoder.encode(updated_at        , forKey: "updated_at")
        
    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        
        self.id                 = decoder.decodeInteger(forKey: "id")
        self.user_id            = (decoder.decodeInteger(forKey: "user_id")) == 1
        self.msg_in_app         = (decoder.decodeInteger(forKey: "msg_in_app")) == 1
        self.msg_push           = (decoder.decodeInteger(forKey: "msg_push")) == 1
        self.match_in_app       = (decoder.decodeInteger(forKey: "match_in_app")) == 1
        self.match_push         = (decoder.decodeInteger(forKey: "match_push")) == 1
        self.exp_match_in_app   = (decoder.decodeInteger(forKey: "exp_match_in_app")) == 1
        self.exp_match_push     = (decoder.decodeInteger(forKey: "exp_match_push")) == 1
        self.like_in_app        = (decoder.decodeInteger(forKey: "like_in_app")) == 1
        self.like_push          = (decoder.decodeInteger(forKey: "like_push")) == 1
        self.created_at         = decoder.decodeObject(forKey: "created_at") as? String ?? ""
        self.updated_at         = decoder.decodeObject(forKey: "updated_at") as? String ?? ""
        
    }
    
    func initSubscriptionFrom(json : [String: Any]) -> NotificationSetting{
        
        let notiSetting = NotificationSetting()
        
        notiSetting.id                 = json["id"] as? Int ?? 0
        notiSetting.user_id            = (json["user_id"] as? Int ?? 0) == 1
        notiSetting.msg_in_app         = (json["msg_in_app"] as? Int ?? 0) == 1
        notiSetting.msg_push           = (json["msg_push"] as? Int ?? 0) == 1
        notiSetting.match_in_app       = (json["match_in_app"] as? Int ?? 0) == 1
        notiSetting.match_push         = (json["match_push"] as? Int ?? 0) == 1
        notiSetting.exp_match_in_app   = (json["exp_match_in_app"] as? Int ?? 0) == 1
        notiSetting.exp_match_push     = (json["exp_match_push"] as? Int ?? 0) == 1
        notiSetting.like_in_app        = (json["like_in_app"] as? Int ?? 0) == 1
        notiSetting.like_push          = (json["like_push"] as? Int ?? 0) == 1
        notiSetting.created_at         = json["created_at"] as? String ?? ""
        notiSetting.updated_at         = json["updated_at"] as? String ?? ""
        
        
        return notiSetting
        
    }
    
}



class VerifyPhoto: NSObject, Codable {
    
    var id: Int?
    var created_at: String?
    var verify_photo_url: String?
    var user_id: Int?
    var request_photo_url: String?
    var verify_photo_id: Int?
    var status: String?
    
    func encode(with acoder: NSCoder) {
        acoder.encode(self.id                   , forKey: "id")
        acoder.encode(self.created_at           , forKey: "created_at")
        acoder.encode(self.verify_photo_url     , forKey: "verify_photo_url")
        acoder.encode(self.user_id              , forKey: "user_id")
        acoder.encode(self.request_photo_url    , forKey: "request_photo_url")
        acoder.encode(self.verify_photo_id      , forKey: "verify_photo_id")
        acoder.encode(self.status               , forKey: "status")
        
    }
    
    required convenience init?(coder decoder: NSCoder) {
        self.init()
        
        self.id                 = decoder.decodeInteger(forKey: "id")
        self.created_at         = decoder.decodeObject(forKey: "timestamp") as? String
        self.verify_photo_url   = decoder.decodeObject(forKey: "media_type") as? String
        self.user_id            = decoder.decodeInteger(forKey: "user_id")
        self.request_photo_url  = decoder.decodeObject(forKey: "media_url") as? String
        self.verify_photo_id    = decoder.decodeInteger(forKey: "verify_photo_id")
        self.status             = decoder.decodeObject(forKey: "status") as? String
    }
    
    func initVerifyPhotoFrom(json : [String: Any]) -> VerifyPhoto{
        
        let image = VerifyPhoto()
        
        image.id                = json["id"] as? Int? ?? 0
        image.created_at        = json["created_at"] as? String ?? ""
        image.verify_photo_url  = APIConstants.BasePath + (json["verify_photo_url"] as? String ?? "")
        image.user_id           = json["user_id"] as? Int ?? 0
        image.request_photo_url = APIConstants.BasePath + (json["request_photo_url"] as? String ?? "")
        image.verify_photo_id   = json["verify_photo_id"] as? Int ?? 0
        image.status            = (json["status"] as? Int ?? 0) == 1 ? "Pending" : (json["status"] as? Int ?? 0) == 2 ? "Verified" : "Pending"
        
        return image
        
    }
    
}
