//
//  HeroImg.swift
//  PetMonster
//
//  Created by Abhishek H P on 4/5/16.
//  Copyright © 2016 Abhishek H P. All rights reserved.
//

import Foundation
import UIKit

class HeroImg: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var isHeroImageSelected: Bool = false
    
    func AnimateHeroAttack() {
        self.animationImages = nil
        
        var ImageArray = [UIImage]()
        
        for x in 1...6 {
            let img = UIImage(named: "heroattack (\(x)).png")
            ImageArray.append(img!)
        }
        
        self.animationImages = ImageArray
        self.animationDuration = 1.0
        self.animationRepeatCount = 0
        self.startAnimating()
    }
    
    func AnimateDeadHero() {
        self.image = UIImage(named: "herodead (5).png")
        self.animationImages = nil
        
        var ImageArray = [UIImage]()
        
        for x in 1 ... 5 {
            let img = UIImage(named: "herodead (\(x)).png")
            ImageArray.append(img!)
        }
        
        self.animationImages = ImageArray
        self.animationDuration = 1.0
        self.animationRepeatCount = 1
        self.startAnimating()
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        if let touch = touches.first {
            isHeroImageSelected = true
        }
    }

}
