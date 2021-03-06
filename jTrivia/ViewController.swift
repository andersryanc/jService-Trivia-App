//
//  ViewController.swift
//  jTrivia
//
//  Created by Ryan Anderson on 12/3/16.
//  Copyright © 2016 mranderson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentQuestionLabel: UILabel!
    @IBOutlet weak var nextQuestionLabel: UILabel!

    @IBOutlet weak var answerLabel: UILabel!
    
    @IBOutlet weak var questionButton: UIButton!
    @IBOutlet weak var answerButton: UIButton!
  
    var triviaModel: JServiceTriviaModel?

    // TODO: Should set this up as a "background service"
//    lazy var triviaModel: JServiceTriviaModel = JServiceTriviaModel(delegate: self)
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear")
        nextQuestionLabel.alpha = 0
    }
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        triviaModel?.next()

        // TODO: When we reach the end of the current loaded set we have to call another async GET request
        // TODO: which in turn causes a "???" question to show while it's loading.
        // TODO: Like above, How to update the label AFTER the request compeltes?
        // TODO: (this is easier to test/see with a low triviaModel.count)
        // TODO: Also, show a loading indicator?
        let question = triviaModel?.questions[(triviaModel?.currentQuestionIndex)!].question
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateQuestionTransitions()
    }
    
    @IBAction func showAnswer(sender: AnyObject) {
        answerLabel.text = triviaModel?.questions[(triviaModel?.currentQuestionIndex)!].answer

        answerLabel.alpha = 0
        animateAnswerTransitions()
    }
    
//    func didReceive(data: Array<Any>) {
//        print("did receive")
//
//        questionLabel.text = triviaModel?.questions[(triviaModel?.currentQuestionIndex)!].question
//        answerLabel.text = "???"
//        
//        questionLabel.alpha = 0
//        animateTransitions()
//    }
    
    func animateQuestionTransitions() {
        UIView.animate(withDuration: 0.5, animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
        }, completion: { _ in
            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
        })
    }
    
    func animateAnswerTransitions() {
        UIView.animate(withDuration: 0.5, animations: {
            self.answerLabel.alpha = 1
        })
    }
    
}

