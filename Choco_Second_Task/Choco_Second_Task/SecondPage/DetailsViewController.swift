//
//  DetailsViewController.swift
//  Choco_Second_Task
//
//  Created by Kim Kiori on 21.09.2018.
//  Copyright © 2018 Kim Kiori. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    @IBOutlet weak var FirstBlock: FirstBlock!
    @IBOutlet weak var SecondBlock: SecondBlock!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirstBlock.viewWithBorder.layer.borderColor = UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha: 1).cgColor
        FirstBlock.viewWithBorder.layer.borderWidth = 1
        FirstBlock.viewWithBorder.layer.cornerRadius = 3
        FirstBlock.viewWithBorder2.layer.borderColor = UIColor(red: 255/255,green: 255/255,blue: 255/255,alpha: 1).cgColor
        FirstBlock.viewWithBorder2.layer.borderWidth = 1
        FirstBlock.viewWithBorder2.layer.cornerRadius = 3
        SecondBlock.viewWithBorder.layer.borderColor = UIColor(red: 158/255,green: 163/255,blue: 183/255,alpha: 1).cgColor
        SecondBlock.viewWithBorder.layer.borderWidth = 1
        SecondBlock.viewWithBorder2.layer.borderColor = UIColor(red: 158/255,green: 163/255,blue: 183/255,alpha: 1).cgColor
        SecondBlock.viewWithBorder2.layer.borderWidth = 1
        NotificationCenter.default.addObserver(self, selector: #selector(closeDetailsViewController), name:NSNotification.Name("closeDetailsViewController"), object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func closeDetailsViewController () {
        present((storyboard?.instantiateViewController(withIdentifier: "ViewController"))!, animated: true, completion: nil)
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
