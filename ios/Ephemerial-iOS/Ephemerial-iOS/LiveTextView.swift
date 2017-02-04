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
  
  // MARK: API functions
  
  func clearText() {
    textView.text = ""
  }
  
  func append(text: String) {
    textView.text = text
  }
}
