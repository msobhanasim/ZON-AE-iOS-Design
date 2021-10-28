//
//  HomeVC.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 18/09/2021.
//

import UIKit
import AdvancedPageControl
class HomeVC: BaseViewController {

    static let identifier = "HomeVC"
    
    var homeViewModel: HomeViewModel = HomeViewModel()
    
//    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var onBoardingPC: AdvancedPageControlView!
    @IBOutlet weak var onBoardingCV: UICollectionView!
    @IBOutlet weak var categoriesCollectionView: UICollectionView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var recentOrdersTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.getData()
    }
    
    @IBAction func didClickViewAllCategories(_ sender: Any) {
        self.showCustomAlert(title: "", message: "Feature Under Development", btnString: "Ok")
    }
    
    @IBAction func didClickViewAllRecentOrders(_ sender: Any) {
        self.showCustomAlert(title: "", message: "Feature Under Development", btnString: "Ok")
    }
    
    func getData() {
        homeViewModel.getCategoriesData(with: { categories, err in
            if let error = err {
                self.showCustomAlert(title: "Error", message: error.localizedDescription, btnString: "Ok")
            } else {
                self.getUser(withCategories: categories ?? [])
                
            }
        })
    }
    
    func getUser(withCategories categories: [Category]){
        
        homeViewModel.getUserData(with: {[weak self] user, error in
            guard let self = self else {return}
            
            if let error = error {
                self.showCustomAlert(title: "Error", message: error.localizedDescription, btnString: "Ok")
            } else {
                self.homeViewModel = HomeViewModel(user: user, categories: categories)
                self.tableViewHeight.constant = CGFloat((self.homeViewModel.getNumberOfOrders()) * 85)
                self.recentOrdersTableView.reloadData()
                self.categoriesCollectionView.reloadData()
            }
            
        })
    }
    
    func setViews(){
        
        onBoardingCV.delegate = self
        onBoardingCV.dataSource = self
        onBoardingCV.register(UINib(nibName: HomeSliderCVCell.identifier, bundle: nil), forCellWithReuseIdentifier: HomeSliderCVCell.identifier)
        
        onBoardingPC.numberOfPages = 3
        onBoardingPC.drawer = ExtendedDotDrawer(numberOfPages: 3, height: 6, width: 6, space: 10, raduis: 3, currentItem: 0, indicatorColor: .black, dotsColor: UIColor(named: "TextGrayColor"), isBordered: false, borderColor: UIColor.clear, borderWidth: 2, indicatorBorderColor: UIColor.clear, indicatorBorderWidth: 0)
        
        categoriesCollectionView.delegate = self
        categoriesCollectionView.dataSource = self
        categoriesCollectionView.register(UINib(nibName: CategoriesColViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoriesColViewCell.identifier)
        
        recentOrdersTableView.delegate = self
        recentOrdersTableView.dataSource = self
        recentOrdersTableView.isScrollEnabled = false
        recentOrdersTableView.separatorStyle = .none
        recentOrdersTableView.register(UINib(nibName: RecentTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: RecentTableViewCell.identifier)
        
        
        
    }
    
}

// MARK: - Table view Delegates

extension HomeVC: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return homeViewModel.getNumberOfOrders()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: RecentTableViewCell.identifier, for: indexPath) as! RecentTableViewCell
        cell.selectionStyle = .none
        cell.setCell(forProduct: self.homeViewModel.getOrderItemAtIndexPath(indexPath: indexPath) ?? Order())
        return cell
    }
}

// MARK: - Collection view Delegates
extension HomeVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == onBoardingCV {
            return 1
        } else {
            return homeViewModel.getNumberOfCategories()
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == onBoardingCV {
            return 3
        } else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == onBoardingCV {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeSliderCVCell.identifier, for: indexPath) as! HomeSliderCVCell
                
            cell.slideImage.image = #imageLiteral(resourceName: "banner_girl_image_ic")
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriesColViewCell.identifier, for: indexPath) as! CategoriesColViewCell
                
            cell.setCell(forCategory: homeViewModel.getCategoryItemAtIndexPath(indexPath: indexPath))
            
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView != onBoardingCV {
            guard let cell = cell as? CategoriesColViewCell else {return}
            cell.setCell(forCategory: homeViewModel.getCategoryItemAtIndexPath(indexPath: indexPath))
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == onBoardingCV {
            return CGSize(width: collectionView.frame.width,
                          height: collectionView.frame.height)
        } else {
            return CGSize(width: 128, height: 146)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView == onBoardingCV{
            let offSet = scrollView.contentOffset.x
            let width = scrollView.frame.width
            
            let index = Int(round(offSet/width))
            onBoardingPC.setPage(index)
        }
    }
}

