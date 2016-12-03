//
//  ViewModel.swift
//  Quiz
//
//  Created by Ryan Anderson on 12/3/16.
//  Copyright © 2016 mranderson. All rights reserved.
//

import Foundation

class ViewModel {
    
    let questions: [String] = ["From what is cognac made?",
                               "What is 7+7?",
                               "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes",
                             "14",
                             "Montpelier"]
    
    var currentQuestionIndex: Int = 0

    func next() {
        currentQuestionIndex += 1
        if ( currentQuestionIndex >= questions.count ) {
            currentQuestionIndex = 0
        }
    }
    
}
