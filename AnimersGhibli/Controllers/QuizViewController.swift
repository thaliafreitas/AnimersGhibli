//
//  QuizViewController.swift
//  AnimersGhibli
//
//  Created by Thalia Freitas on 17/10/18.
//  Copyright © 2018 Thalia Freitas. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, BackButtonDelegate {
    
    

    @IBOutlet weak var scrollQuiz: UIScrollView!
    @IBOutlet weak var questionLbl: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var resultLbl: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        scrollQuiz.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height+150)
        print(CoreDataManager.sharedInstance.movies.count)
        questions = [
            Question(
                question: "Who is the producer of Castle in The Sky?",
                answers: [CoreDataManager.sharedInstance.movies[0].producer!, CoreDataManager.sharedInstance.movies[1].producer!, CoreDataManager.sharedInstance.movies[2].producer!, CoreDataManager.sharedInstance.movies[3].producer!],
                correctAnswer: 0),
            Question(
                question: "Which film Hayao Miyazaki was a producer?",
                answers: [CoreDataManager.sharedInstance.movies[17].title!,CoreDataManager.sharedInstance.movies[3].title!, CoreDataManager.sharedInstance.movies[7].title!, CoreDataManager.sharedInstance.movies[2].title!],
                correctAnswer: 3),
            Question(
                question: "Which year did you release the movie Porco Rosso?",
                answers: [CoreDataManager.sharedInstance.movies[5].releaseData!,CoreDataManager.sharedInstance.movies[13].releaseData!,CoreDataManager.sharedInstance.movies[18].releaseData!, CoreDataManager.sharedInstance.movies[9].releaseData!],
                correctAnswer: 2)
        ]
        
        currentQuestion = questions[0]
        setQuestion()
        setButtonDesigner()
    }
    
    
    struct Question {
        let question: String
        let answers: [String]
        let correctAnswer: Int
    }
    
    
    
    
    var questions: [Question] = []
    var currentQuestion: Question?
    var currentQuestionPos = 0
    
    var noCorrect = 0
    
   
    
    @IBAction func submitAnswer1(_ sender: Any) {
        checkAnswer(idx: 0)
        if currentQuestion!.correctAnswer == 0{
            answer1.backgroundColor = .green
        }
    }
    @IBAction func submitAnswer2(_ sender: Any) {
        checkAnswer(idx: 1)
        if currentQuestion!.correctAnswer == 1{
            answer1.backgroundColor = .green
        }
    }
    @IBAction func submitAnswer3(_ sender: Any) {
        checkAnswer(idx: 2)
        if currentQuestion!.correctAnswer == 2{
            answer1.backgroundColor = .green
        }
    }
    @IBAction func submitAnswer4(_ sender: Any) {
        checkAnswer(idx: 3)
        if currentQuestion!.correctAnswer == 3{
            answer1.backgroundColor = .green
        }
    }
    
    
    func checkAnswer(idx: Int) {
        let buttonDict: [UIButton] = [answer1, answer2, answer3, answer4]
        if(idx == currentQuestion!.correctAnswer) {
            
            noCorrect += 1
            
        }
        answer1.backgroundColor = .clear
        answer2.backgroundColor = .clear
        answer3.backgroundColor = .clear
        answer4.backgroundColor = .clear
        loadNextQuestion()
    }
    
    func loadNextQuestion() {
        // Show next question
        if(currentQuestionPos + 1 < questions.count) {
            currentQuestionPos += 1
            currentQuestion = questions[currentQuestionPos]
            setQuestion()
            // If there are no more questions show the results
        } else {
            performSegue(withIdentifier: "showResult", sender: nil)
        }
        
        
    }
    
    func setButtonDesigner() {
        answer1.backgroundColor = .clear
        answer2.backgroundColor = .clear
        answer3.backgroundColor = .clear
        answer4.backgroundColor = .clear
        answer1.layer.cornerRadius = 5
        answer1.layer.cornerRadius = 5
        answer2.layer.cornerRadius = 5
        answer3.layer.cornerRadius = 5
        answer4.layer.cornerRadius = 5
        answer1.layer.borderWidth = 1
        answer2.layer.borderWidth = 1
        answer3.layer.borderWidth = 1
        answer4.layer.borderWidth = 1
        
    }
    
    
    func  setBackfroundColor() {
        let colorTop =  UIColor(red: 120/255, green: 150/255, blue: 232/255, alpha: 1)
        
        self.view.backgroundColor = colorTop
    }
    
    // Set labels and buttions for the current question
    func setQuestion() {
        

        questionLbl.text = currentQuestion!.question
        answer1.setTitle(currentQuestion!.answers[0], for: .normal)
        answer2.setTitle(currentQuestion!.answers[1], for: .normal)
        answer3.setTitle(currentQuestion!.answers[2], for: .normal)
        answer4.setTitle(currentQuestion!.answers[3], for: .normal)
        resultLbl.text = "\(currentQuestionPos + 1) / \(questions.count)"
    }
    
    
    func backToFirstQuizView() {
        _ = navigationController?.popViewController(animated: true)
         currentQuestion = questions[0]
        setQuestion()
    }
    
    // Before we move to the results screen pass the how many we got correct, and the total number of questions
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showResult") {
            let vc = segue.destination as! ScoreViewController
            vc.noCorrect = noCorrect
            vc.total = questions.count
            vc.delegate = self
        }
    }
    
    
    
    
}
