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
    @IBOutlet weak var selectLabel: UILabel!
    @IBOutlet weak var restartBtn: UIButton!
    
    let DIM: CGFloat = 0.2
    let OPAQUE: CGFloat = 1.0
    var num = 0
    
    
    var timer: NSTimer!
    var SelectImageTimer: NSTimer!
    var penalties: Int = 0
    var isCharacterHappy: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        DeadImg1.alpha = DIM
        DeadImg2.alpha = DIM
        DeadImg3.alpha = DIM
        
        restartBtn.hidden = true
        
        monsterImage.hidden = true
        heroImage.hidden = true
        
        HeartImg.userInteractionEnabled = true
        FruitImg.userInteractionEnabled = true
        FoodImg.userInteractionEnabled = true
        
        setNotification()
        
        RandomImage()
    }
    
    func RandomImage() {
        SelectImageTimer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "ChooseImage:", userInfo: nil, repeats: true)
        selectLabel.hidden = false
        restartBtn.hidden = true
        ChooseImage(num)
    }
    
    func setNotification() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "itemDroppedOnTarget:", name: "onTargetDropped", object: nil)
    }
    
    
    func ChooseImage(number: Int) {
        if num == 0{
            monsterImage.hidden = false
            monsterImage.userInteractionEnabled = true
            heroImage.hidden = true
            //heroImage.userInteractionEnabled = false
            
            if monsterImage.isMonsterTouched == true {
                SelectImageTimer.invalidate()
                HeartImg.dropTarget = monsterImage
                FoodImg.dropTarget = monsterImage
                FruitImg.dropTarget = monsterImage
                selectLabel.hidden = true
                monsterImage.AnimateIdleMonster()
                StartTimer()
            }
            
        } else if num == 1 {
            heroImage.hidden = false
            heroImage.userInteractionEnabled = true
            monsterImage.hidden = true
            //monsterImage.userInteractionEnabled = false
            
            if heroImage.isHeroImageSelected == true {
                SelectImageTimer.invalidate()
                 selectLabel.hidden = true
                HeartImg.dropTarget = heroImage
                FoodImg.dropTarget = heroImage
                FruitImg.dropTarget = heroImage
                heroImage.AnimateHeroAttack()
                StartTimer()
            }

        }
        
        num += 1
        
        if num > 2 {
            num = 0
        }
    }
    
    func itemDroppedOnTarget(notification: UIView) {
        isCharacterHappy = true
        StartTimer()
        
        HeartImg.alpha = DIM
        HeartImg.userInteractionEnabled = false
        FoodImg.alpha = DIM
        FoodImg.userInteractionEnabled = false
        FruitImg.alpha = DIM
        FruitImg.userInteractionEnabled = false
    }
    
    func StartTimer () {
        if timer != nil {
            timer.invalidate()
        }
        
        timer = NSTimer.scheduledTimerWithTimeInterval(3.0, target: self, selector: "ChangeGameState", userInfo: nil, repeats: true)
    }
    
    func ChangeGameState() {
        if !isCharacterHappy {
        penalties += 1
            if penalties == 1 {
                DeadImg1.alpha = OPAQUE
                DeadImg2.alpha = DIM
            } else if penalties == 2 {
                DeadImg2.alpha = OPAQUE
                DeadImg3.alpha = DIM
            } else if penalties >= 3 {
                DeadImg3.alpha = OPAQUE
                
                gameover()
            }
        }
        
        let rand = arc4random_uniform(3)
        
        if rand == 0{
            HeartImg.alpha = OPAQUE
            HeartImg.userInteractionEnabled = true
            
            FoodImg.alpha = DIM
            FruitImg.alpha = DIM
            FoodImg.userInteractionEnabled = false
            FruitImg.userInteractionEnabled = false
        } else if rand == 1 {
            FruitImg.alpha = OPAQUE
            FruitImg.userInteractionEnabled = true
            
            HeartImg.alpha = DIM
            HeartImg.userInteractionEnabled = false
            FoodImg.alpha = DIM
            FoodImg.userInteractionEnabled = false
        } else {
            FoodImg.alpha = OPAQUE
            FoodImg.userInteractionEnabled = true
            
            HeartImg.alpha = DIM
            HeartImg.userInteractionEnabled = false
            FruitImg.alpha = DIM
            FruitImg.userInteractionEnabled = false
        }
        
        isCharacterHappy = false
    }
    
    func gameover() {
        if monsterImage.isMonsterTouched == true {
             timer.invalidate()
            monsterImage.AnimateDeadMonster()
            restartBtn.hidden = false
            monsterImage.isMonsterTouched = false
            num = 0
            penalties =  0
        } else if heroImage.isHeroImageSelected == true {
             timer.invalidate()
            heroImage.AnimateDeadHero()
            restartBtn.hidden = false
            heroImage.isHeroImageSelected = false
            num = 0
            penalties = 0
        }
    }
    
    
    @IBAction func onRestartPressed(sender: AnyObject) {
        
        DeadImg1.alpha = DIM
        DeadImg2.alpha = DIM
        DeadImg3.alpha = DIM
        
        HeartImg.alpha = DIM
        FruitImg.alpha = DIM
        FoodImg.alpha = DIM
        
        HeartImg.userInteractionEnabled = false
        FruitImg.userInteractionEnabled = false
        FoodImg.userInteractionEnabled = false
        
        monsterImage.image = UIImage(named: "idle1.png")
        heroImage.image = UIImage(named: "hero idle (1).png")

        RandomImage()
    }

}




