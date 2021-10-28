//
//  UIView.swift
//  SwiftyShadow
//
//  Created by luan on 7/23/17.
//
//

import UIKit

extension UIView {
    open func generateHeaderOuterShadow() {
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = frame.height/2
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(hex: "#00000008").cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        clipsToBounds = false
        backgroundColor = .white
        layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
    }
    open func generateHeaderButtonOuterShadow() {
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = frame.height / 2
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        clipsToBounds = false
        backgroundColor = .white
        //        layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
    }
    open func generatViewShadow() {
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 20
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 0)
        clipsToBounds = false
        backgroundColor = .white
        //        layer.maskedCorners = [.layerMinXMaxYCorner,.layerMaxXMaxYCorner]
        
    }
    open func generateInnerHeaderOuterShadow() {
        
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = frame.height/2
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        layer.shadowColor = UIColor(hex: "#00000008").cgColor
        layer.shadowOffset = CGSize(width: 0, height: 4)
        clipsToBounds = false
        backgroundColor = .white
        layer.maskedCorners = [.layerMaxXMinYCorner,.layerMinXMinYCorner]
        
    }
    open func generateOuterShadow() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = layer.cornerRadius
        view.layer.shadowRadius = layer.shadowRadius
        view.layer.shadowOpacity = layer.shadowOpacity
        view.layer.shadowColor = layer.shadowColor
        view.layer.shadowOffset = layer.shadowOffset
        view.clipsToBounds = false
        view.backgroundColor = .white
        
        superview?.insertSubview(view, belowSubview: self)
        
        let constraints = [
            NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ]
        superview?.addConstraints(constraints)
    }
    
    open func generateEllipticalShadow() {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = layer.cornerRadius
        view.layer.shadowRadius = layer.shadowRadius
        view.layer.shadowOpacity = layer.shadowOpacity
        view.layer.shadowColor = layer.shadowColor
        view.layer.shadowOffset = layer.shadowOffset
        view.clipsToBounds = false
        view.backgroundColor = .white
        
        let ovalRect = CGRect(x: 0, y: frame.size.height + 10, width: frame.size.width, height: 15)
        let path = UIBezierPath(ovalIn: ovalRect)
        
        view.layer.shadowPath = path.cgPath
        
        superview?.insertSubview(view, belowSubview: self)
        
        let constraints = [
            NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0),
            NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0),
        ]
        superview?.addConstraints(constraints)
    }
    open func addBorder(cornerRadius : CGFloat) {
        
        layer.cornerRadius = frame.height/2
        layer.shadowRadius = 4
        layer.shadowOpacity = 1
        //        layer.shadowColor = UIColor(hex: "#00000008").cgColor
        layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.16).cgColor
        clipsToBounds = false
        backgroundColor = .white
        layer.shadowOffset = CGSize(width: 0, height: 4)
        
        //        layer.cornerRadius = CGFloat(cornerRadius)
        //        layer.borderColor = UIColor(hexString: "#E2E2E2")?.cgColor
        //        layer.borderWidth = 1
        
        
    }
    func addBorderInAddAddress(cornerRadius : CGFloat) {
        clipsToBounds = false
        backgroundColor = .white
        layer.cornerRadius = CGFloat(cornerRadius)
        layer.borderColor = UIColor(hex: "E2E2E2").cgColor
        layer.borderWidth = 1
        
        
    }
    
}
