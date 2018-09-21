//
//  ViewController.swift
//  Choco_Second_Task
//
//  Created by Kim Kiori on 21.09.2018.
//  Copyright © 2018 Kim Kiori. All rights reserved.
//

import UIKit

struct cellData {
    let cell:Int!
    let numberText: String!
    let dateText: String!
    let surname1Text: String!
    let surname2Text: String!
    let flight1Text: String!
    let flight2Text: String!
    let statusText: String!
    let statusImage: UIImage!
}

class TableViewController: UITableViewController {
    var arrayofData = [cellData]()
    
    func preferredStatusBarStyle() -> UIStatusBarStyle
    {
        return UIStatusBarStyle.default
    }
    
    override func viewDidLoad() {
        arrayofData = [cellData(cell: 2, numberText: "№ 201245123", dateText: "23.10.2016", surname1Text: "MAZENTSEV", surname2Text: "MUKHORYAPOV", flight1Text: "Астана  -  Алма-Ата  /  01.01.2017", flight2Text: "Москва  -  Санкт-Петербург  /  03.03.2017", statusText: "Оформлен", statusImage: UIImage(named: "greenIcon")),cellData(cell: 2, numberText: "№ 201245123", dateText: "23.10.2016", surname1Text: "MAZENTSEV", surname2Text: "MUKHORYAPOV", flight1Text: "Астана  -  Алма-Ата  /  01.01.2017", flight2Text: "Москва  -  Санкт-Петербург  /  03.03.2017", statusText: "Ошибка оформления", statusImage: UIImage(named: "redIcon")),cellData(cell: 2, numberText: "№ 201245123", dateText: "23.10.2016", surname1Text: "MAZENTSEV", surname2Text: "MUKHORYAPOV", flight1Text: "Астана  -  Алма-Ата  /  01.01.2017", flight2Text: "Москва  -  Санкт-Петербург  /  03.03.2017", statusText: "Ожидается подтверждение", statusImage: UIImage(named: "blueIcon"))]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayofData.count
        
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell2", owner: self, options: nil)?.first as! TableViewCell2
        cell.statusLabel.text = arrayofData[indexPath.row].statusText
        if (cell.statusLabel.text! == "Оформлен")
        {
            print(cell.statusLabel.text!)
            cell.statusLabel.textColor = UIColor(red: 76/255,green: 175/255,blue: 80/255,alpha: 1)
        }
        if (cell.statusLabel.text! == "Ошибка оформления")
        {
            cell.statusLabel.textColor = UIColor(red: 255/255,green: 65/255,blue: 50/255,alpha: 1)
        }
        if (cell.statusLabel.text! == "Ожидается подтверждение")
        {
            cell.statusLabel.textColor = UIColor(red: 82/255,green: 143/255,blue: 200/255,alpha: 1)
        }
        cell.numberLabel.text = arrayofData[indexPath.row].numberText
        cell.dateLabel.text = arrayofData[indexPath.row].dateText
        cell.flight1Label.text = arrayofData[indexPath.row].flight1Text
        cell.flight2Label.text = arrayofData[indexPath.row].flight2Text
        cell.surname1Label.text = arrayofData[indexPath.row].surname1Text
        cell.surname2Label.text = arrayofData[indexPath.row].surname2Text
        cell.statusImage.image = arrayofData[indexPath.row].statusImage
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44;
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = Bundle.main.loadNibNamed("HeaderView", owner: self, options: nil)?.first as! HeaderView
        return headerView
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        present((storyboard?.instantiateViewController(withIdentifier: "DetailsViewController"))!, animated: true, completion: nil)
    }
}

