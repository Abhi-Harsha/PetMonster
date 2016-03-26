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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        monsterImage.AnimateIdleMonster()
    }
}

