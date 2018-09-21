//
//  SecondBlock.swift
//  Choco_Second_Task
//
//  Created by Kim Kiori on 21.09.2018.
//  Copyright © 2018 Kim Kiori. All rights reserved.
//

import UIKit

class SecondBlock: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var viewWithBorder: UIView!
    @IBOutlet weak var viewWithBorder2: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        SecondBlock()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        SecondBlock()
    }
    private func SecondBlock() {
        Bundle.main.loadNibNamed("SecondBlock", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
