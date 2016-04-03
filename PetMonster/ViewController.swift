//
//  ViewController.swift
//  PetMonster
//
//  Created by Abhishek H P on 3/26/16.
//  Copyright © 2016 Abhishek H P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var monsterImage: MonsterImg!
    @IBOutlet weak var HeartImg: DragImag!
    @IBOutlet weak var FoodImg: DragImag!
    @IBOutlet weak var DeadImg1: UIImageView!
    @IBOutlet weak var DeadImg2: UIImageView!
    @IBOutlet weak var DeadImg3: UIImageView!
    
    let DIM: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    
    var timer: NSTimer!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        monsterImage.AnimateIdleMonster()
        
        HeartImg.dropTarget = monsterImage
        FoodImg.dropTarget = monsterImage
        
        DeadImg1.alpha = DIM
        DeadImg2.alpha = DIM
        DeadImg3.alpha = DIM
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnTarget:", name: "onTargetDropped", object: nil)
    }
    
    func itemDroppedOnTarget(notification: UIView) {
        
    }
    
    func StartTimer () {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "ChangeGameState", userInfo: nil, repeats: true)
    }
    
    func ChangeGameState() {
        
    }

}




