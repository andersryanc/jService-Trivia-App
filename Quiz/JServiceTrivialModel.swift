//
//  JServiceModel.swift
//  Quiz
//
//  Created by Ryan Anderson on 12/3/16.
//  Copyright © 2016 mranderson. All rights reserved.
//

import Foundation

struct TriviaQuestion {
    var question: String = "???"
    var answer: String = "???"
    
    init() {

    }
    
    init(withQuestion q: String, andAnswer a: String) {
        self.question = q
        self.answer = a
    }
}

class JServiceTriviaModel {
    
    var questions: [TriviaQuestion] = [TriviaQuestion()]
    var isLoading: Bool = true
    var count = 50
    var currentQuestionIndex = 0
    
    init() {
        self.loadQuestions()
    }
    
    func loadQuestions() {
        self.questions = [TriviaQuestion()]
        
        let url = URL(string: "http://jservice.io/api/random?count=\(self.count)")
        URLSession.shared.dataTask(with: url!) { data, response, err in
            
            guard err == nil else {
                print(err!)
                return
            }
            
            guard let data = data else {
                print("Data is empty")
                return
            }
            
            let json:Array<Any> = try! JSONSerialization.jsonObject(with: data, options: [.mutableContainers]) as! Array<Any>
            
            // Reset the questions so we end up with ONLY the new ones
            self.questions = []
            for i in 0 ..< json.count {
                // TODO: skip blank questions (I've seem a few blank ones appear during testing)
                
                let dictResult = json[i] as! NSDictionary
                let newQuestion = dictResult.value(forKey: "question") as! String
                let newAnswer = dictResult.value(forKey: "answer") as! String
                
                self.questions.append( TriviaQuestion(withQuestion: newQuestion, andAnswer: newAnswer) )
                
            }
            
            }.resume()
    }
    
    func next() {
        self.currentQuestionIndex += 1
        if self.currentQuestionIndex >= self.questions.count {
            self.loadQuestions()
            self.currentQuestionIndex = 0
        }
    }
    
}
