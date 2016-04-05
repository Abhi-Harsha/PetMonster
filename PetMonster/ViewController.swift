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
    @IBOutlet weak var heroImage: HeroImg!
    @IBOutlet weak var HeartImg: DragImag!
    @IBOutlet weak var FoodImg: DragImag!
    @IBOutlet weak var FruitImg: DragImag!
    @IBOutlet weak var DeadImg1: UIImageView!
    @IBOutlet weak var DeadImg2: UIImageView!
    @IBOutlet weak var DeadImg3: UIImageView!
    
    let DIM: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    var num = 0
    
    var timer: NSTimer!
    var SelectImageTimer: NSTimer!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        monsterImage.hidden = true
        heroImage.hidden = true
        
       SelectImageTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "RandomImage", userInfo: nil, repeats: true)
        
        //monsterImage.AnimateIdleMonster()
        
        //HeartImg.dropTarget = monsterImage
        //FoodImg.dropTarget = monsterImage
        
        DeadImg1.alpha = DIM
        DeadImg2.alpha = DIM
        DeadImg3.alpha = DIM
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnTarget:", name: "onTargetDropped", object: nil)
    }
    
    func RandomImage() {
        ChooseImage(num)
    }
    
    func ChooseImage(number: Int) {
        if num == 0{
            monsterImage.hidden = false
            monsterImage.userInteractionEnabled = true
            heroImage.hidden = true
            heroImage.userInteractionEnabled = false
            
        } else if num == 1 {
            heroImage.hidden = false
            heroImage.userInteractionEnabled = true
            monsterImage.hidden = true
            monsterImage.userInteractionEnabled = false
        }
        
        num += 1
        
        if num > 2 {
            num = 0
        }
    }
    
    func itemDroppedOnTarget(notification: UIView) {
        StartTimer()
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




