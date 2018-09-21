//
//  FirstBlock.swift
//  Choco_Second_Task
//
//  Created by Kim Kiori on 21.09.2018.
//  Copyright © 2018 Kim Kiori. All rights reserved.
//

import UIKit

class FirstBlock: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var viewWithBorder: UIView!
    @IBOutlet weak var viewWithBorder2: UIView!
    @IBOutlet weak var backButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        FirstBlock()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        FirstBlock()
    }
    private func FirstBlock() {
        Bundle.main.loadNibNamed("FirstBlock", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
    @IBAction func backButtonTapped(_ sender: Any) {
        NotificationCenter.default.post(name: NSNotification.Name("closeDetailsViewController"), object: nil)
    }
    
}
