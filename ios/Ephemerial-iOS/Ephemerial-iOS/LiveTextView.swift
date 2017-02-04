//
//  LiveTextView.swift
//  Ephemerial-iOS
//
//  Created by Franklin Schrans on 2/4/17.
//  Copyright © 2017 Franklin Schrans. All rights reserved.
//

import UIKit

class LiveConversationView: UIScrollView {
  
  // MARK: Properties
  
  var textView: UITextView!
  
  var disappearDelay = 3.0 {
    didSet {
      
    }
  }
  
  private var timer: Timer?
  
  // MARK: API functions
  
  func append(text: String) {
    textView.text = text
  }
  
  // MARK: Disappearing handlers
  
  func clear(after delay: TimeInterval) {
    Timer.scheduledTimer(withTimeInterval: delay, repeats: false) { _ in
      self.textView.text = ""
    }
  }
  
  private func animateClear() {
    
  }
}
