//
//  ViewController.swift
//  Choco_First_Task
//
//  Created by Kim Kiori on 17.09.2018.
//  Copyright © 2018 Kim Kiori. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import SwiftyJSON
import SQLite3
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var mainCurrencyLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let currencies = ["USD","GBP","EUR","KZT","JPY","AUD"]
    var showCurrencies = [String]()
    var costs = [String]()
    var db: OpaquePointer?
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        var mainCurrency = UserDefaults.standard.string(forKey: "mainCurrency")
        if mainCurrency == nil
        {
            mainCurrency="KZT"
        }
        mainCurrencyLabel.text = mainCurrency
        costs.removeAll()
        showCurrencies.removeAll()
        for item in currencies
        {
            Alamofire.request("https://free.currencyconverterapi.com/api/v6/convert?q=\(item)_\(mainCurrency!)&compact=ultra").responseJSON
                    {
                        response in
                        if let result = response.result.value {
                            let json = JSON(result)
                            print("JSON: \(json)")
                            self.showCurrencies.append("\(item)")
                            self.costs.append("\(json["\(item)_\(mainCurrency!)"])")
                            self.tableView.reloadData()
                        }
                }
        }
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        
        let fileManager = FileManager.default
        var sqliteDB: OpaquePointer? = nil
        let dbUrl: NSURL? = nil
        do{
            _ = try fileManager.url(for: .documentDirectory, in: .userDomainMask,appropriateFor: nil, create: false)
        } catch{
            print("Error")
        }
        if let dbUrl = dbUrl
        {
            let flags = SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE
            let status = sqlite3_open_v2(dbUrl.absoluteString?.cString(using: String.Encoding.utf8)!,&sqliteDB, flags, nil)
            if status == SQLITE_OK
            {
                let errMessage: UnsafeMutablePointer< UnsafeMutablePointer<Int8>?>! = nil
                let sqlStatement = "create table if not exists Exchange_rate (ID Integer Primary key AutoIncrement, From Text, To Text, Cost Double);"
                if sqlite3_exec(sqliteDB,sqlStatement,nil,nil,errMessage) == SQLITE_OK
                {
                    print("created table")
                }
                else
                {
                    print("error creating table")
                }
                if (dateString=="02:24" || dateString=="18:00")
                {
                    for item in currencies
                    {
                        var index = 0;
                        var statement: OpaquePointer? = nil
                        let insertstatement = "insert into Exchange_rate(From,To,Cost) values ('\(mainCurrency!)','\(item)','\(costs[index])');"
                        sqlite3_prepare_v2(sqliteDB, insertstatement, -1, &statement, nil)
                        if sqlite3_step(statement) == SQLITE_DONE
                        {
                            print("inserted")
                        }
                        else
                        {
                            print("not inserted")
                        }
                        index = index+1;
                        sqlite3_finalize(statement)
                    }
                    
                }
                var selectStatement: OpaquePointer? = nil
                let selectsql = "select * from Exchange_rate"
                if sqlite3_prepare_v2(sqliteDB, selectsql, -1, &selectStatement, nil) == SQLITE_OK
                {
                    while sqlite3_step(selectStatement) == SQLITE_ROW
                    {
                        let rowId = sqlite3_column_int(selectStatement, 0)
                        let from = sqlite3_column_text(selectStatement, 1)
                        let to = sqlite3_column_text(selectStatement, 2)
                        let cost = sqlite3_column_double(selectStatement, 3)
                        print ("\(rowId)","\(from!)","\(to!)","\(cost)")
                    }
                }
                 sqlite3_finalize(selectStatement)
            }
        }
    }
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showCurrencies.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let costLabel = cell.viewWithTag(112) as! UILabel
        if costs.count == 6
        {
            costLabel.text = costs[indexPath.row]
        }
        let currencyLabel = cell.viewWithTag(111) as! UILabel
        if showCurrencies.count == 6
        {
            currencyLabel.text = showCurrencies[indexPath.row]
        }
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

