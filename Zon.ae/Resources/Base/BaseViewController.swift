//
//  BaseViewController.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 16/10/2021.
//

import UIKit
import Photos
import BRYXBanner
import Hero
import GSImageViewerController
import SkeletonView


enum Storyboards: String{
    /// `Main Entry Point`
    case Main = "Main"
    
    /// `Other StoryBorads`
    case Home = "Home"
    case Alerts = "Alerts"
    case Auth = "Authentication"
    case Quote = "Quotations"
    case Delivery = "Delivery"
    case Profile = "Profile"
    case Search = "Search"
    case Finance = "FinanceManagement"
    func board() -> String {
        return self.rawValue
    }
}


enum ThemeMode: String {
    case light = "light"
    case dark = "dark"
    
}

var firstAlbumAssets : [PHAsset] = [PHAsset]()
var currentAlbum : PHAssetCollection = PHAssetCollection.init()
var allAlbums : [CustomAlbum] =  [CustomAlbum]()

class BaseViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//
        if DataManager.sharedInstance.CurrentAppTheme == .dark {
            setDarkBackground()
        } else {
            setGradientBackground()
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    @IBAction func onBackButtonClicked(_ sender: Any) {
        self.Goback()
    }
    
    func scape(Orientation : String){
        switch Orientation {
        case "landScape":
            let value = UIInterfaceOrientation.landscapeLeft.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            
           
        case "portrait":
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
            
        default:
            print("")
        }
    }
    
    func showImage(_ startingImageView: UIImageView) {
        let imageInfo   = GSImageInfo(image: startingImageView.image ?? UIImage(), imageMode: .aspectFit, imageHD: nil)
        let transitionInfo = GSTransitionInfo(fromView: startingImageView)
        let imageViewer  = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)
        present(imageViewer, animated: true, completion: nil)
      }
    func setGradientBackground()  {

      


//            self.view.backgroundColor = .white
//            let colorTop =  UIColor(hexColor: "0D8576").withAlphaComponent(0.2).cgColor
//            let colorBottom = UIColor(hexColor: "35175D").withAlphaComponent(0.2).cgColor
//
//            let gradientLayer = CAGradientLayer()
//            gradientLayer.colors =  [colorTop, colorBottom]
//            gradientLayer.locations = [0.0, 0.8]
//            gradientLayer.frame = self.view.bounds
//
//            self.view.layer.insertSublayer(gradientLayer, at:0)
        
    }
    
    func setDarkBackground()  {
        
//            self.view.backgroundColor = UIColor(named: "BackGroundColor")
        
    }
    
    func showInfoAlert (title : String , message : String) {
        let banner = Banner(title: title, subtitle: message , image: nil, backgroundColor: UIColor.init(hexColor: "1992A9"))
           banner.dismissesOnTap = true
           banner.show(duration: 2.0)
       }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if let subLayers = self.view.layer.sublayers {
            for (index, subLayer) in subLayers.enumerated() {
                if subLayer is CAGradientLayer {
                    self.view.layer.sublayers?.remove(at: index)
                }
            }
        }
        
        if #available(iOS 13.0, *) {
            if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                if traitCollection.userInterfaceStyle == .dark {
                    setDarkBackground()
                } else {
                    setGradientBackground()
                }
            }
        } else {
            // Fallback on earlier versions
        }
    }
    
    var customWindow : UIWindow {
        return UIApplication.shared.windows.first!
    }
    
    var hasTopNotch: Bool {
        if #available(iOS 11.0, tvOS 11.0, *) {
            return UIApplication.shared.delegate?.window??.safeAreaInsets.top ?? 0 > 20
        }
        return false
    }
    
    func presentImagePicker(){
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.allowsEditing = true
        vc.delegate = self
        vc.mediaTypes = ["public.image"]
        self.present(vc, animated: true)
    }
    
    func changeTheme(themeVal: ThemeMode, with window: UIWindow?) {
        if #available(iOS 13.0, *) {
            switch themeVal {
            case .dark:
                window?.overrideUserInterfaceStyle = .dark
                DataManager.sharedInstance.CurrentAppTheme = .dark
                break
            case .light:
                window?.overrideUserInterfaceStyle = .light
                DataManager.sharedInstance.CurrentAppTheme = .light
                break
            }
        }
    }
    
    func ShowPopup() {
        
    }
    
    func downloadVideoOrImage(urlString : String , completion : @escaping ((Bool)->Void)) {
        self.showLoading()
        DispatchQueue.global(qos: .background ).async {
            if let url = URL(string: urlString),
                let urlData = NSData(contentsOf: url) {
                let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0];
                let filePath="\(documentsPath)/tempFile.mp4"
                DispatchQueue.main.async {
                    urlData.write(toFile: filePath, atomically: true)
                    PHPhotoLibrary.shared().performChanges({
                        PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL: URL(fileURLWithPath: filePath))
                    }) { completed, error in
                        DispatchQueue.main.async {
                            self.hideLoading()
                            if completed {
                                completion(true)
                            }
                            if error != nil{
                                completion(false)
                            }
                        }
                    }
                }
            }
        }
    }
    
    func fetchAlbums() {
       var albums = [CustomAlbum]()
        var result = PHAssetCollection.fetchAssetCollections(with: .album , subtype: .any, options: nil)
        result.enumerateObjects({ (collection, _, _) in
            if (collection.hasPhotosAssets()) {
                
                let album = CustomAlbum()
                album.album = collection
                album.coverimage = collection.getCoverImgWithSize(CGSize(width: 100, height: 100))
                albums.append(album)
            }
        })
        
//
        result = PHAssetCollection.fetchAssetCollections(with: .smartAlbum , subtype: .any, options: nil)
        result.enumerateObjects({ (collection, _, _) in
            if (collection.hasPhotosAssets() ) {
                let album = CustomAlbum()
                album.album = collection
                album.coverimage = collection.getCoverImgWithSize(CGSize(width: 100, height: 100))
                albums.append(album)
            }
        })
        
        for i in 0..<albums.count {
            if albums[i].album.localizedTitle == "Recents" {
                let temp = albums[0]
                albums[0] = albums[i]
                albums[i] = temp
                break
            }
        }
        self.loadFirstAlbum(albums: albums) { (albums, curentCollection) in
            
            
           
            self.fetchImagesFromGalleryBase(collection: curentCollection) { (assets) in
                firstAlbumAssets = assets
                
                currentAlbum = curentCollection
                
                allAlbums = albums
                
                NotificationCenter.default.post(name: Notification.Name(rawValue: "setViewForFirstAlbum"), object: nil)
            }
        }
    }
    
    func fetchImagesFromGallery(collection: PHAssetCollection? , completion : @escaping (([PHAsset])->Void)) {
        DispatchQueue.main.async {
            var assets : [PHAsset] = [PHAsset]()
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate",ascending: false)]
            
            //MARK:- FOR IM@objc AGES AND VIDEOS
            //            fetchOptions.predicate = NSPredicate(format: "mediaType = %d || mediaType = %d", PHAssetMediaType.image.rawValue, PHAssetMediaType.video.rawValue)
            fetchOptions.predicate = NSPredicate(format: "mediaType = %d || mediaType = %d",  PHAssetMediaType.image.rawValue)
            //                let imagesAndVideos = PHAsset.fetchAssets(with: fetchOptions)
            //
            //                fetchOptions.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.image.rawValue)
            
            
            //                fetchOptions.predicate = NSPredicate(format: "mediaType = %d", argumentArray: [PHAssetMediaType.video.rawValue , PHAssetMediaType.image.rawValue] )
            if let collection = collection {
                let assestsRec = PHAsset.fetchAssets(in: collection, options: fetchOptions)
                for index in 0..<assestsRec.count {
//                    if  (assestsRec[index].mediaType == .video &&  assestsRec[index].sourceType == .typeUserLibrary && assestsRec[index].duration < 60 && assestsRec[index].duration > 2){
//
//                        firstAlbumAssets.append(assestsRec[index])
//
//                    }
                    if  (assestsRec[index].mediaType == .image &&  assestsRec[index].sourceType == .typeUserLibrary ){
                        assets.append(assestsRec[index])
                    }
                    
                }
                
                
                //                    fetchOptions.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.video.rawValue)
                //                    let videoRec = PHAsset.fetchAssets(in: collection, options: fetchOptions)
                //                    for index in 0..<videoRec.count {
                //                        self.arrayOfPHAsset.append(videoRec[index])
                //                    }
                
                
                
            } else {
                let assestsRec = PHAsset.fetchAssets(with: fetchOptions)
                for index in 0..<assestsRec.count {
                    assets.append(assestsRec[index])
                }
                
                //                    fetchOptions.predicate = NSPredicate(format: "mediaType = %d", PHAssetMediaType.video.rawValue)
                //                    let videoRec = PHAsset.fetchAssets(with: fetchOptions)
                //                    for index in 0..<videoRec.count {
                //                        self.arrayOfPHAsset.append(assestsRec[index])
                //                    }
            }
            
            completion(assets)
            
//            self.mainCollectionView.reloadData()
        }
    }
    
    func fetchImagesFromGalleryBase(collection: PHAssetCollection? , complition : @escaping([PHAsset])-> Void) {
        var arrayOfPHAsset  = [PHAsset]()
        DispatchQueue.main.async {
            let fetchOptions = PHFetchOptions()
            fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate",ascending: false)]
            fetchOptions.predicate = NSPredicate(format: "mediaType = %d",  PHAssetMediaType.image.rawValue)
            if let collection = collection {
                let assestsRec = PHAsset.fetchAssets(in: collection, options: fetchOptions)
                for index in 0..<assestsRec.count {
//                    if  (assestsRec[index].mediaType == .video &&  assestsRec[index].sourceType == .typeUserLibrary && assestsRec[index].duration < 60 && assestsRec[index].duration > 2  ){
//
//                        arrayOfPHAsset.append(assestsRec[index])
//                    }
                    
                    if (assestsRec[index].mediaType == .image &&  assestsRec[index].sourceType == .typeUserLibrary) {
                        arrayOfPHAsset.append(assestsRec[index])
                    }
//                    if  (assestsRec[index].mediaType == .video && assestsRec[index].sourceType == .typeUserLibrary){
//                        if assestsRec[index].duration < 60 && assestsRec[index].sourceType == .typeUserLibrary {
//
//                            arrayOfPHAsset.append(assestsRec[index])
//                        }
//                    }
                    
                    
                }
            } else {
                let assestsRec = PHAsset.fetchAssets(with: fetchOptions)
                for index in 0..<assestsRec.count {
                    arrayOfPHAsset.append(assestsRec[index])
                }
            }
            
            complition(arrayOfPHAsset)
        }
    }
    
    func loadFirstAlbum (albums : [CustomAlbum], complition : @escaping([CustomAlbum],PHAssetCollection)-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            var settled = false
            
            for i in albums {
                
                if i.album.localizedTitle ?? "" == "Recents" {
                    settled = true
                    complition(albums,i.album)
                }
            }
            if !settled && albums.count > 0 {
                complition(albums,(albums.first?.album)!)
            }
            
        }
    }
    
    func openOtherAppLink(linkText : String) {
        var link = ""
        if linkText.hasPrefix("http"){
            link = linkText.lowercased()
        }
        else {
            link = "https://\(linkText)".lowercased()
        }
        
        
        if let url = URL(string: link ){
            
            
            if UIApplication.shared.canOpenURL(url) {
                
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url)
                }
                else {
                    UIApplication.shared.openURL(url)
                }
            }
            
        }
        else {
            self.showCustomAlert(title: "Error", message: "Url is not correct", btnString: "Ok")
        }
    }
    
    func topMostController() -> UIViewController {
            var topController: UIViewController = UIApplication.shared.keyWindow!.rootViewController!

            while (topController.presentedViewController != nil) {
                topController = topController.presentedViewController!

            }
        
            return topController
        }
    
    func CollectionviewNoDataAvailabl(collection_view : UICollectionView , text : String , color:UIColor = UIColor.darkGray ) {
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: collection_view.bounds.size.width, height: collection_view.bounds.size.height))
        noDataLabel.font = UIFont(name: "SofiaProLight", size: 15)
        noDataLabel.text          = text + "   "
        noDataLabel.textColor     = color
        noDataLabel.textAlignment = .center
        noDataLabel.backgroundColor = .clear
        collection_view.backgroundView  = noDataLabel
    }
    
    func TableViewRemoveNoDataLable(tableview : UITableView ) {
        tableview.backgroundView  = nil
    }
    
    func CollectionViewRemoveNoDataLable(collection_view : UICollectionView ) {
        collection_view.backgroundView  = nil
    }
    
    func TableViewNoDataAvailabl(tableview : UITableView , text : String, textColor: UIColor = UIColor.darkGray) {
        
        let noDataLabel: UILabel     = UILabel(frame: CGRect(x: 0, y: 0, width: tableview.bounds.size.width, height: tableview.bounds.size.height))
        noDataLabel.font = UIFont(name: "SofiaProLight", size: 15)
        noDataLabel.text          = text + "   "
        noDataLabel.textColor     = textColor
        noDataLabel.textAlignment = .center
        tableview.backgroundView  = noDataLabel
        tableview.separatorStyle  = .none
    }
    
    func showLoading(isWhite : Bool = false) {
        DispatchQueue.main.async {
            
        }
    }
    
    func hideLoading() {
        DispatchQueue.main.async {
            
        }
    }
    
    func showSuccessAlert (title : String , message : String) {
           let banner = Banner(title: title, subtitle: message , image: nil, backgroundColor: UIColor.init(hexColor: "008B65") )
           banner.dismissesOnTap = true
           banner.show(duration: 2.0)
       }

       func showErrorAlert  (title : String , message : String) {
           let banner = Banner(title: title, subtitle: message , image: UIImage(named: "Error"), backgroundColor: UIColor(hexColor: "DC3F5E"))
           banner.dismissesOnTap = true
           banner.show(duration: 2.0)
       }
    
    func shareToOtherApp(text : String , image : UIImage , isActualImage : Bool = false) {
       
        // set up activity view controller
        var list : [Any] = []
        if text != ""{
            list.append(text)
        }
        if isActualImage {
            list.append(image)
        }
        let activityViewController = UIActivityViewController(activityItems: list, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
        
        
        // present the view controller
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func hideCustomLoader(){
//        Loaf.dismiss(sender: self)
    }
    
    func openVc (vc : UIViewController, animate: Bool = true) {
        if self.navigationController  != nil{
            self.navigationController?.pushViewController(vc, animated: animate)
        }
        else {
            self.present(vc, animated : animate)
        }
    }
    
    func back() {
        if let nev = self.navigationController {
//            NotificationCenter.default.post(name: Notification.Name(rawValue: "goBackFromLive"), object: nil)
            nev.popViewController(animated: true)
        } else {
            self.dismiss(animated: true) {}
//            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func showCustomAlertWithCancel(title:String, message:String, btnString: String, handlers: ((UIAlertAction) -> Void)? = nil){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: btnString, style: .default, handler: handlers))
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(alertController, animated: true, completion: nil)
    }
    
   
    
    
    func animateLittle(seconds : Double = 0.2){
        UIView.animate(withDuration: seconds) {
            self.view.layoutIfNeeded()
        }
    }
    
    func animateLittle(completion : @escaping (()->Void)){
        UIView.animate(withDuration: 0.2) {
            self.view.layoutIfNeeded()
            self.delay(0.1) {
                completion()
            }
        }
    }
    
    func Goback(animate: Bool = true) {
        if let nev = self.navigationController{
            
            nev.popViewController(animated: animate)
        }else{
            self.dismiss(animated: animate) {
        }
//            self.dismiss(animated: true, completion: nil)
        }
    }
    
  
    
    func createThumbnailOfVideoFromRemoteUrl(url: String) -> UIImage? {
        let asset = AVAsset(url: URL(string: url)!)
        let assetImgGenerate = AVAssetImageGenerator(asset: asset)
        assetImgGenerate.appliesPreferredTrackTransform = true
        //Can set this to improve performance if target size is known before hand
        //assetImgGenerate.maximumSize = CGSize(width,height)
        let time = CMTimeMakeWithSeconds(1.0, preferredTimescale: 600)
        do {
            let img = try assetImgGenerate.copyCGImage(at: time, actualTime: nil)
            let thumbnail = UIImage(cgImage: img)
            return thumbnail
        } catch {
            print("*** Error generating thumbnail: \(error.localizedDescription)")
            return nil
        }
    }
}

extension BaseViewController {
    func ShowErrorAlert(message : String , AlertTitle : String ) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.simpleCustomeAlert(title: AlertTitle, discription: message)
        })
    }
    
    @objc func simpleCustomeAlert(title : String , discription : String) {
        SweetAlert().closeAlert(0)
        _ = SweetAlert().showAlert(title, subTitle: discription, style: AlertStyle.none)
    }
    
    @objc func ShowSuccessAlert(title:String,message : String , completion: @escaping () -> () ) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3, execute: {
            self.oneBtnCustomeAlert(title: title, discription: message) { (isComp, btn) in
                completion()
            }
        })
    }
    
    @objc func oneBtnCustomeAlert(title : String , discription : String  , btnTitle : String = "OK" ,complition : @escaping(Bool,Int) -> Void) {
        SweetAlert().showAlert(title, subTitle: discription, style: AlertStyle.none, buttonTitle:"", buttonColor:UIColor.colorFromRGB(0xD0D0D0) , otherButtonTitle:  btnTitle, otherButtonColor: UIColor.colorFromRGB(0x2e84a5)) { (isOtherButton) -> Void in
            if isOtherButton == true {
                complition(true,1)
            }  else {
                complition(false,2)
            }
        }
    }
    
    @objc func confirmationCustomeAlert(title : String , discription : String , btnColor1: UIColor = UIColor.colorFromRGB(0x2e84a5), btnColor2: UIColor = UIColor.colorFromRGB(0xD0D0D0), btnTitle1 : String = "YES" , btnTitle2 : String = "NO" ,complition : @escaping(Bool,Int) -> Void) {
        SweetAlert().showAlert(title, subTitle: discription, style: AlertStyle.none, buttonTitle:btnTitle2, buttonColor:btnColor2 , otherButtonTitle:  btnTitle1, otherButtonColor: btnColor1) { (isOtherButton) -> Void in
            if isOtherButton == true {
                complition(false,2)
            }  else {
                complition(true,1)
            }
        }
    }
    
    //MARK: Delay
    func delay(_ seconds: Double, completion: @escaping () -> ()) {
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            completion()
        }
    }
    
}


extension UIViewController {
    func getVC(storyboard : Storyboards, vcIdentifier : String) -> UIViewController {
        //String = kStoryBoardMain
        return UIStoryboard(name: storyboard.board(), bundle: nil).instantiateViewController(withIdentifier: vcIdentifier)
    }
    
}

extension DispatchQueue {
    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }

}

extension BaseViewController {
    var isDarkMode: Bool {
        if #available(iOS 13.0, *) {
            return self.traitCollection.userInterfaceStyle == .dark
        }
        else {
            return false
        }
    }

}

extension UITableViewCell {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

extension UIViewController {
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}

extension BaseViewController {
    
//    func apiGetItemsData(){
//        cartViewModelObj1.getCartItems()
//        cartViewModelObj1.cartItemCallBack = { cart in
//            self.cartItem1 = cart
//
//
//
//
//        }
////
////
//    }
}
//
//extension BaseViewController : BTViewControllerPresentingDelegate{
//    func paymentDriver(_ driver: Any, requestsPresentationOf viewController: UIViewController) {
//        print("requestsPresentationOf")
//    }
//
//    func paymentDriver(_ driver: Any, requestsDismissalOf viewController: UIViewController) {
//        print("requestsDismissalOf")
//    }
//
//}
//
//extension BaseViewController : BTAppSwitchDelegate {
//    func appSwitcherWillPerformAppSwitch(_ appSwitcher: Any) {
//        print("appSwitcherWillPerformAppSwitch")
//    }
//
//    func appSwitcher(_ appSwitcher: Any, didPerformSwitchTo target: BTAppSwitchTarget){
//        print("appSwitcherdidPerformSwitchTo")
//    }
//
//    func appSwitcherWillProcessPaymentInfo(_ appSwitcher: Any) {
//        print("appSwitcherWillProcessPaymentInfo")
//    }
//
//}
//


struct PaypalPaymentDetail{
    var transactionNonce: String?
    var email: String?
    var firstName: String?
    var lastName: String?
    var phone: String?
    var billingAddress: String?
    var shippingAddress: String?
}
extension UIViewController{
    var screenWidth:CGFloat {
        get {
            return UIScreen.main.bounds.width
        }
    }
    
    var screenHeight:CGFloat {
        get {
            return UIScreen.main.bounds.height
        }
    }
    
}
class CustomAlbum {
    var coverimage = UIImage()
    var album = PHAssetCollection()
}

class CustomSlide: UISlider {

     @IBInspectable var trackHeight: CGFloat = 2

    override func trackRect(forBounds bounds: CGRect) -> CGRect {
         //set your bounds here
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: trackHeight))
       }
}

extension Data {
    var html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var html2String: String { html2AttributedString?.string ?? "" }
}

extension StringProtocol {
    var html2AttributedString: NSAttributedString? {
        Data(utf8).html2AttributedString
    }
    var html2String: String {
        html2AttributedString?.string ?? ""
    }
}

extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
