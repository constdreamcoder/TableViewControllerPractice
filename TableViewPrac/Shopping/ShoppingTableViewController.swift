//
//  ShoppingTableViewController.swift
//  TableViewPrac
//
//  Created by SUCHAN CHANG on 1/5/24.
//

import UIKit

struct Shopping {
    var isChecked: Bool
    let shoppingItem: String
    var isStared: Bool
}

final class ShoppingTableViewController: UITableViewController {

    @IBOutlet weak var addContainerView: UIView!
    @IBOutlet weak var addItemTextField: UITextField!
    @IBOutlet weak var addItemButton: UIButton!
    
    var shoppingList: [Shopping] = [
        Shopping(isChecked: false, shoppingItem: "그립톡 구매하기", isStared: false),
        Shopping(isChecked: false, shoppingItem: "사이다 구매", isStared: false),
        Shopping(isChecked: false, shoppingItem: "아이패드 케이스 최저가 알아보기", isStared: false),
        Shopping(isChecked: false, shoppingItem: "양말", isStared: false)
    ]
        
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    private func configureUI() {
        navigationItem.title = "쇼핑"
        view.backgroundColor = .white
                
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
        
        cell.configureUI()
        
        cell.shoppingListItemLabel.text = shoppingList[indexPath.row].shoppingItem
        
        let shoppingItem = shoppingList[indexPath.row]
        
        let checkmarkButtonImageName = shoppingItem.isChecked ? "checkmark.square.fill" : "checkmark.square"
        cell.configureButton(cell.checkmarkButton, imageName: checkmarkButtonImageName, row: indexPath.row)
        cell.checkmarkButton.addTarget(self, action: #selector(checkmarkButtonTapped), for: .touchUpInside)
        
        let starButtonImageName = shoppingItem.isStared ? "star.fill" : "star"
        cell.configureButton(cell.starButton, imageName: starButtonImageName, row: indexPath.row)
        cell.starButton.addTarget(self, action: #selector(starButtonTapped), for: .touchUpInside)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    
    @objc func checkmarkButtonTapped(sender: UIButton) {
        print("체크")
        shoppingList[sender.tag].isChecked.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @objc func starButtonTapped(sender: UIButton) {
        print("즐겨찾기")
        shoppingList[sender.tag].isStared.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @IBAction func addTextFieldReturnTapped(_ sender: UITextField) {
        addNewItem()
    }
    
    @IBAction func addItemButtonTapped(_ sender: UIButton) {
        addNewItem()
    }
    
    private func addNewItem() {
        guard addItemTextField.text! != "" else { return }
        
        shoppingList.append(Shopping(isChecked: false, shoppingItem: addItemTextField.text!, isStared: false))
        addItemTextField.text = ""
        tableView.reloadData()
    }
    
}
