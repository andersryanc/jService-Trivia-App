//
//  ViewController.swift
//  jTrivia
//
//  Created by Ryan Anderson on 12/3/16.
//  Copyright © 2016 mranderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var answerButton: UIButton!
    
    var triviaModel: JServiceTriviaModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        triviaModel = JServiceTriviaModel()
        // TODO: How to update the label AFTER the first load is complete?
        // NOTE: there is no need to try and show the "current" question until the issue below is solved
        // questionLabel.text = triviaModel?.questions[(triviaModel?.currentQuestionIndex)!].question

        // NOTE: trivialModel.loadQuestions() is called in the init() method
        // NOTE: should I call it here instead? would that allow me to add a completion handler here?
        
        // TODO: Need to handle no internet connection
    }
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        // TODO: When we reach the end of the current loaded set we have to call another async GET request
        // TODO: which in turn causes a "???" question to show while it's loading.
        // TODO: Like above, How to update the label AFTER the request compeltes?
        // TODO: (this is easier to test/see with a low triviaModel.count)
        // TODO: Also, show a loading indicator?
        questionLabel.text = triviaModel?.questions[(triviaModel?.currentQuestionIndex)!].question
        answerLabel.text = "???"

        // NOTE: Calling next AFTER the current question is displayed seems to help the above problem a little
        // NOTE: (because the new data can load "in the background" while you read/answer the current one
        triviaModel?.next()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        answerLabel.text = triviaModel?.questions[(triviaModel?.currentQuestionIndex)!].answer
    }
    
}

