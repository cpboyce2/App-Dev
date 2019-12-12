//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let allQuestions = QuestionBank()
    var pickedAnswer : Bool = false
    var questionNumber : Int = -1
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
        updateUI()
        progressLabel.text = "1 / 13"
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        
        if sender.tag == 1{
            pickedAnswer = true
        }
        else if sender.tag == 2{
            pickedAnswer = false
        }
        
        if questionNumber < 13{
            checkAnswer(answer: pickedAnswer)
            nextQuestion()
        }
    }
    
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        myCondition: if questionNumber == 12{
            break myCondition
        }
        else {
            progressLabel.text = "\((questionNumber+2)) / 13"
            progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNumber+2)
        }
    }
    
    func nextQuestion() {
        
        questionNumber += 1
        if questionNumber == 13{
            let alert = UIAlertController(title: "Nice job!", message: "You've finished all of the questions, would you like to start over?", preferredStyle: .alert)
            
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        }
        else{
            questionLabel.text = allQuestions.list[questionNumber].myQuestionText
        }
    }
    
    func checkAnswer(answer : Bool) {
        
        let correctAnswer = allQuestions.list[questionNumber].answer
        if correctAnswer == answer{
            score += 1
            ProgressHUD.showSuccess("Correct!")
            updateUI()
        }
        else{
            ProgressHUD.showError("Wrong")
            updateUI()
        }
    }
    
    func startOver() {
        
        scoreLabel.text = "\(0)"
        score = 0
        questionNumber = -1
        updateUI()
        nextQuestion()
       
    }
}
