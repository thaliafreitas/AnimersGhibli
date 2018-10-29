//
//  ScoreViewController.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 23/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    
    
    @IBOutlet weak var scrollScore: UIScrollView!
    
    @IBOutlet weak var scoreLbl: UILabel!
    @IBOutlet weak var resultsLbl: UILabel!

    var noCorrect = 0
    var total = 0
    var delegate: BackButtonDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Set the results
        resultsLbl.text = "You got \(noCorrect) out of \(total) correct"

        // Calculate the percentage of quesitons you got right
        var percentRight = Double(noCorrect) / Double(total)
        percentRight *= 100

        // Based on the percentage of questions you got right present the user with different message
        var title = ""
        if(percentRight < 40) {
            title = "Not Good"
        } else if(percentRight < 70) {
            title = "Almost"
        } else {
            title = "Good Job"
        }
        scoreLbl.text = title
        scrollScore.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+200)
        setBackfroundColor()
    }
    
    func  setBackfroundColor() {
        let colorTop =  UIColor(red: 197/255, green: 246/255, blue: 232/255, alpha: 1)
        
        self.view.backgroundColor = colorTop
    }
    
    
    
    @IBAction func BackButton(_ sender: Any) {
        delegate?.backToFirstQuizView()
        self.dismiss(animated: true)
    }
    
}
    



