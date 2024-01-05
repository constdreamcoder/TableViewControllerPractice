//
//  SettingsTableViewController.swift
//  TableViewPrac
//
//  Created by SUCHAN CHANG on 1/5/24.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    let sectionHeaderTitleList = ["전체 설정", "개인 설정", "기타"]
    
    let firstSectionRowTextList = ["공지사항", "실험실", "버전 정보"]
    let secondSectionRowTextList = ["개인/보안", "알림", "채팅", "멀티프로필"]
    let thirdSectionRowTextList = ["고객센터/도움말"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "설정"
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionHeaderTitleList.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return firstSectionRowTextList.count
        } else if section == 1 {
            return secondSectionRowTextList.count
        } else {
            return thirdSectionRowTextList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell")!
        if indexPath.section == 0 {
            cell.textLabel?.text = firstSectionRowTextList[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = secondSectionRowTextList[indexPath.row]
        } else {
            cell.textLabel?.text = thirdSectionRowTextList[indexPath.row]
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionHeaderTitleList[section]
    }
}
