//
//  MonsterImg.swift
//  PetMonster
//
//  Created by Abhishek H P on 3/27/16.
//  Copyright © 2016 Abhishek H P. All rights reserved.
//

import Foundation
import UIKit

class MonsterImg: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func AnimateIdleMonster() {
        var ImageArray = [UIImage]()
        for x in 1...4 {
            let img = UIImage(named: "idle\(x).png")
            ImageArray.append(img!)
        }
        
        self.animationImages = ImageArray
        self.animationDuration = 0.8
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
}