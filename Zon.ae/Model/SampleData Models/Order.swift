//
//  Order.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 18/09/2021.
//

import Foundation


enum TransitStatus: String, Codable{
    case PaymentPending = "Payment Pending"
    case PaymentVerificationPending = "Payment Verification Pending"
    case PaymentVerificationCompleted = "Payment Accepted"
    case OrderInPreperation = "Preparing your Order"
    case OrderPrepared = "Order Ready to be shipped"
    case OrderShipped = "On the Way"
}

struct Order: Codable {
    var productId: Int?
    var productName: String?
    var productImage: String?
    var productTransitRemainingTime: String?
    var productCurrentTransitStatus: TransitStatus?
    
}
