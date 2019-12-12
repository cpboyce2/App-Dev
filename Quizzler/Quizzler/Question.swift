//
//  Question.swift
//  Quizzler
//
//  Created by Connor Boyce on 8/7/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    
    let myQuestionText: String
    let answer: Bool
    
    init(text: String, correctAnswer: Bool){
       myQuestionText = text
       answer = correctAnswer
    }
    
}
