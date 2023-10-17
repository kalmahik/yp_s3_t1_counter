//
//  UITextView+Utils.swift
//  Counter
//
//  Created by Murad Azimov on 17.10.2023.
//

import UIKit

extension UITextView {
    
    func scrollToBottom() {
        if self.text.count > 0 {
            let location = self.text.count - 1
            let bottom = NSMakeRange(location, 1)
            self.scrollRangeToVisible(bottom)
        }
    }
    
}
