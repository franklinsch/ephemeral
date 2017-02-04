//
//  LiveTextView.swift
//  Ephemerial-iOS
//
//  Created by Franklin Schrans on 2/4/17.
//  Copyright © 2017 Franklin Schrans. All rights reserved.
//

import UIKit

class LiveConversationView: UITableView {
  
  // MARK: Properties
  
  var disappearDelay = 3.0 {
    didSet {
      
    }
  }
  
  private var timer: Timer?
  
  // MARK: API functions
  
  func append(text: String) {
    
  }
  
  // MARK: Disappearing handlers
  
  func clear(after delay: TimeInterval) {
  }
  
  private func animateClear() {
    
  }
}
