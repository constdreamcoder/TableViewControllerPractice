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
        
    func configureUI() {
        cellElementsContainerView.backgroundColor = .systemGray6
        cellElementsContainerView.layer.cornerRadius = 10
    }
    
    func configureButton(_ button: UIButton, imageName: String, row: Int) {
        button.tag = row
        let buttonImage = UIImage(systemName: imageName)?.withTintColor(.black, renderingMode: .alwaysOriginal)
        button.setImage(buttonImage, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
    }
}
