//
//  ViewController.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 16/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class CharacteristicsPeopleViewController: UIViewController {

    @IBOutlet weak var scrollTableDetail: UIScrollView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    @IBOutlet weak var eye: UILabel!
    @IBOutlet weak var hair: UILabel!
//    @IBOutlet weak var film: UILabel!
    @IBOutlet weak var specie: UILabel!
    
    var nameCharacter: String?
    var ageCharacter: String?
    var genderCharacter: String?
    var eyeCharacter: String?
    var hairCharacter: String?
    var filmCharacter: String?
    var specieCharacter: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        name.text = nameCharacter!
        age.text = ageCharacter!
        gender.text = genderCharacter!
        eye.text = eyeCharacter!
        hair.text = hairCharacter!
//        film.text = filmCharacter
        specie.text = specieCharacter
        scrollTableDetail.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+200)
        setBackfroundColor()
    }
    
    func  setBackfroundColor() {
        let colorTop =  UIColor(red: 197/255, green: 246/255, blue: 232/255, alpha: 1)
        
        self.view.backgroundColor = colorTop
    }


}

