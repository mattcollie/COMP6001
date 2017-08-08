//
//  CurvedSlider.swift
//  ass1
//
//  Created by Matt & Geoff on 9/08/17.
//  Copyright © 2017 Matt & Geoff. All rights reserved.
//

import UIKit

class UICurvedSlider: UIControl {
    
    var radious:CGFloat = 0
    var textField:UITextField?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.clear
        self.isOpaque = true
    }
}
