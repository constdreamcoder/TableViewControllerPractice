//
//  ShoppingTableViewCell.swift
//  TableViewPrac
//
//  Created by SUCHAN CHANG on 1/5/24.
//

import UIKit

class ShoppingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cellElementsContainerView: UIView!
    @IBOutlet weak var checkmarkButton: UIButton!
    @IBOutlet weak var shoppingListItemLabel: UILabel!
    @IBOutlet weak var starButton: UIButton!
    @IBOutlet weak var seperatorView: UIView!
    
    let randomCheckmarkImage = ["checkmark.square", "checkmark.square.fill"]
    let randomStarImage = ["star", "star.fill"]
    
    func configureUI() {
        cellElementsContainerView.backgroundColor = .systemGray6
        cellElementsContainerView.layer.cornerRadius = 10
        
        let checkmarkButtonImage = UIImage(systemName: randomCheckmarkImage.randomElement()!)
        checkmarkButton.setImage(checkmarkButtonImage, for: .normal)
        checkmarkButton.imageView?.contentMode = .scaleAspectFit
        
        let starButtonImage = UIImage(systemName: randomStarImage.randomElement()!)
        starButton.setImage(starButtonImage, for: .normal)
        starButton.imageView?.contentMode = .scaleAspectFit
    }
}
