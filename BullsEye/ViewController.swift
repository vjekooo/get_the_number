//
//  ViewController.swift
//  BullsEye
//
//  Created by Vjeko on 19/09/2018.
//  Copyright © 2018 Vjeko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValue: Int = 0
    var targetValue: Int = 0
    var currentRound: Int = 0
    var score = 0
    
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var targetLabel: UILabel!
    
    @IBOutlet weak var roundLabel: UILabel!
    
    @IBOutlet weak var scoreLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let roundValue = slider.value.rounded()
        currentValue = Int(roundValue)
        startNewGame()
    }

    @IBAction func showAlert() {
        
        let difference = abs(currentValue - targetValue)
        var points = 100 - difference
        
        score += points
        
        let title: String
        if difference == 0 {
            title = "Perfect"
            points += 100
        } else if difference < 5 {
            title = "Almost"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good"
        } else {
            title = "Not even close"
        }
        
        let message = "You hit \(currentValue)" +
            "\n and score \(points) points"
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "OK", style: .default, handler: {
            action in
            self.startNewRound()
        })
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func getSliderValue(_ slider: UISlider) {
        let roundValue = slider.value.rounded()
        currentValue = Int(roundValue)
    }
    
    func startNewRound() {
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        currentRound += 1
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        roundLabel.text = String(currentRound)
        scoreLabel.text = String(score)
    }
    
    @IBAction func startNewGame() {
        score = 0
        currentRound = 0
        startNewRound()
    }
}

