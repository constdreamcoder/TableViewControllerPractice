//
//  ShoppingTableViewController.swift
//  TableViewPrac
//
//  Created by SUCHAN CHANG on 1/5/24.
//

import UIKit

final class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var addContainerView: UIView!
    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var addItemButton: UIButton!
    
    var shoppingList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"]
    
    let randomCheckmarkImage = ["checkmark.square", "checkmark.square.fill"]
    let randomStarImage = ["star", "star.fill"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        navigationItem.title = "쇼핑"
        view.backgroundColor = .white
        
        tableView.separatorStyle = .none
        
        addContainerView.backgroundColor = .systemGray6
        addContainerView.layer.cornerRadius = 10
        
        addItemTextField.placeholder = "무엇을 구매하실 건가요?"
        addItemTextField.font = .systemFont(ofSize: 16.0)
        addItemTextField.borderStyle = .none
        
        addItemButton.setTitle("추가", for: .normal)
        addItemButton.titleLabel?.font = .systemFont(ofSize: 16.0)
        addItemButton.setTitleColor(.black, for: .normal)
        addItemButton.layer.cornerRadius = 15
        addItemButton.backgroundColor = .systemGray5
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.cellElementsContainerView.backgroundColor = .systemGray6
        cell.cellElementsContainerView.layer.cornerRadius = 10
        
        let checkmarkButtonImage = UIImage(systemName: randomCheckmarkImage.randomElement()!)
        cell.checkmarkButton.setImage(checkmarkButtonImage, for: .normal)
        cell.checkmarkButton.imageView?.contentMode = .scaleAspectFit
        
        cell.shoppingListItemLabel.text = shoppingList[indexPath.row]
        
        let starButtonImage = UIImage(systemName: randomStarImage.randomElement()!)
        cell.starButton.setImage(starButtonImage, for: .normal)
        cell.starButton.imageView?.contentMode = .scaleAspectFit
                
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    @IBAction func addTextFieldReturnTapped(_ sender: UITextField) {
        addNewItem()
    }
    
    @IBAction func addItemButtonTapped(_ sender: UIButton) {
        addNewItem()
    }
    
    private func addNewItem() {
        guard addItemTextField.text! != "" else { return }
        
        shoppingList.append(addItemTextField.text!)
        addItemTextField.text = ""
        tableView.reloadData()
    }
    
}
