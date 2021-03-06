//
//  DraftTableViewCell.swift
//  Vagary
//
//  Created by Jonathan Witten on 10/7/17.
//  Copyright © 2017 Jonathan Witten. All rights reserved.
//

import UIKit

class DraftTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

struct DraftCellViewModel: CellViewModel {
    var reuseIdentifier: String = "DraftCellViewModel"
    
    var title: String
    
    init(title: String = "") {
        self.title = title
    }
    
    func configure(_ cell: UITableViewCell) {
        if let cell = cell as? DraftTableViewCell {
            cell.titleLabel.text = title
        }
    }
}
