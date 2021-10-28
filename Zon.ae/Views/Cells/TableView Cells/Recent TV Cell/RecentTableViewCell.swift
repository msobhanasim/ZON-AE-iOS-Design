//
//  RecentTableViewCell.swift
//  Zon.ae
//
//  Created by Sobhan Asim on 18/09/2021.
//

import UIKit

class RecentTableViewCell: UITableViewCell {

    static let identifier = "RecentTableViewCell"
    
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productArrivalTimeLbl: UILabel!
    @IBOutlet weak var productCurrentTransitStatusBtn: UIButton!
    
    var index = 0
    
    func setCell(forProduct product: Order){
        productTitle.text = product.productName ?? "N/A"
        productArrivalTimeLbl.text = product.productTransitRemainingTime
        productCurrentTransitStatusBtn.setTitle((product.productCurrentTransitStatus ?? .PaymentPending)?.rawValue, for: .normal)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
