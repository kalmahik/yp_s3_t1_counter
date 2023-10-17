//
//  ViewController.swift
//  Counter
//
//  Created by Murad Azimov on 17.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var incrementButton: UIButton!
    @IBOutlet weak var decrementButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyText: UITextView!
    
    var counterValue: Int = 0 {
        didSet {
            counterLabel.text = "Значение счётчика: \(max(counterValue, 0))"
        }
    }
    
    @IBAction func incrementTapped() { //а тут не принято писать вот так: onIncrementPress?
        counterValue = max(counterValue, 0) + 1
        addToHistory("значение изменено на +1")
    }
    
    @IBAction func decrementTapped() {
        counterValue -= 1
        addToHistory(counterValue < 0 ? "попытка уменьшить значение счётчика ниже 0" : "значение изменено на -1")
    }
    
    @IBAction func resetTapped() {
        counterValue = 0
        addToHistory("значение сброшено")
    }
    
    func addToHistory(_ actionMessage: String) {
        let now = generateTimeStampString()
        historyText.text += "[\(now)]: \(actionMessage)\n"
        historyText.scrollToBottom()
    }
    
    func generateTimeStampString() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DATE_FORMAT
        return dateFormatter.string(from: Date())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = "Значение счётчика: 0"
        historyText.layer.cornerRadius = 8
        historyText.layer.borderWidth = 1
        historyText.isEditable = false
    }
}

