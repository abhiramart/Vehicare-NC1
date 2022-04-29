//
//  NeedsTableViewCell.swift
//  Vehicare
//
//  Created by Abhirama Rizkia Triadi on 27/04/22.
//

import UIKit

class NeedsTableViewCell: UITableViewCell {

    @IBOutlet weak var descNeeds: UILabel!
    @IBOutlet weak var lastNeeds: UILabel!
    @IBOutlet weak var nextdateNeeds: UILabel!
    
    func setNeeds(needs: Needs){
        descNeeds.text = needs.desc
        lastNeeds.text = needs.last
        nextdateNeeds.text = needs.next
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
