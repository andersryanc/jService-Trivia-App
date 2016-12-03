//
//  ViewController.swift
//  Quiz
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
    
    var model: ViewModel? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        model = ViewModel()
        questionLabel.text = model?.questions[(model?.currentQuestionIndex)!]
    }

    @IBAction func showNextQuestion(sender: AnyObject) {
        model?.next()
        questionLabel.text = model?.questions[(model?.currentQuestionIndex)!]
        answerLabel.text = "???"
    }

    @IBAction func showAnswer(sender: AnyObject) {
        answerLabel.text = model?.answers[(model?.currentQuestionIndex)!]
    }

}

