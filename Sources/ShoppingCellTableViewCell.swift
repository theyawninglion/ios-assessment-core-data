//
//  ShoppingCellTableViewCell.swift
//  ShoppingList
//
//  Created by Taylor Phillips on 2/10/17.
//  Copyright © 2017 DevMountain. All rights reserved.
//

import UIKit

class ShoppingCellTableViewCell: UITableViewCell {
    
    weak var delegate: GotItButtonShoppingCellTableViewCellDelegate?
    
    @IBOutlet weak var gotItButton: UIButton!
    @IBOutlet weak var itemLabel: UILabel!
    
    
    
    @IBAction func gotItButtonTapped(_ sender: Any) {
        delegate?.gotItButtonTapped(sender: self)
    }
    var shopping: Shopping? {
        didSet{
            updateViews()
        }
    }
    //updateviews
    private func updateViews(){
        guard let shopping = shopping else {itemLabel.text = ""; return}
        itemLabel.text = shopping.item
        
        let buttonImage = shopping.gotIt ? #imageLiteral(resourceName: "complete") : #imageLiteral(resourceName: "incomplete")
        gotItButton.setImage(buttonImage, for: .normal)
        
    }

}

protocol GotItButtonShoppingCellTableViewCellDelegate: class {
    func gotItButtonTapped(sender: ShoppingCellTableViewCell)
}
