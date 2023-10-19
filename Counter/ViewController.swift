//
//  ViewController.swift
//  Counter
//
//  Created by Murad Azimov on 17.10.2023.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var counterLabel: UILabel!
    @IBOutlet private weak var incrementButton: UIButton!
    @IBOutlet private weak var decrementButton: UIButton!
    @IBOutlet private weak var resetButton: UIButton!
    @IBOutlet private weak var historyText: UITextView!
    
    var counterValue: Int = 0 {
        didSet {
            counterLabel.text = "Значение счётчика: \(max(counterValue, 0))"
        }
    }
    
    @IBAction private func incrementTapped() {
        counterValue = max(counterValue, 0) + 1
        addToHistory("значение изменено на +1")
    }
    
    @IBAction private func decrementTapped() {
        counterValue -= 1
        addToHistory(counterValue < 0 ? "попытка уменьшить значение счётчика ниже 0" : "значение изменено на -1")
    }
    
    @IBAction private func resetTapped() {
        counterValue = 0
        addToHistory("значение сброшено")
    }
    
    private func addToHistory(_ actionMessage: String) {
        let now = generateTimeStampString()
        historyText.text += "[\(now)]: \(actionMessage)\n"
        historyText.scrollToBottom()
    }
    
    private func generateTimeStampString() -> String {
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

