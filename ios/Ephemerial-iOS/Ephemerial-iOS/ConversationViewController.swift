//
//  ConversationView.swift
//  Ephemerial-iOS
//
//  Created by Franklin Schrans on 2/4/17.
//  Copyright © 2017 Franklin Schrans. All rights reserved.
//

import UIKit

class ConversationViewController: UIViewController {
  
  @IBOutlet weak var liveConversationView: LiveConversationView!
  
  @IBOutlet weak var liveTextView: LiveTextView!
  
  @IBOutlet weak var liveConversationViewBottomConstraint: NSLayoutConstraint!
  
  // MARK: Setup
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpKeyboardNotifications()
    setUpLiveTextView()
    
    liveConversationView.clear(after: 2)
  }
  
  private func setUpKeyboardNotifications() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: .UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: .UIKeyboardWillHide, object: nil)
  }
  
  private func setUpLiveTextView() {
    liveConversationView.textView = liveTextView
  }
  
  // MARK: Keyboard notification handlers
  
  @objc private func keyboardWillShow(sender: NSNotification) {
    let info = sender.userInfo!
    let keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
    let keyboardHeight = keyboardFrame.size.height
    
    UIView.animate(withDuration: 0.1, animations: { () -> Void in
      self.liveConversationViewBottomConstraint.constant = keyboardHeight
    })
    
  }
  
  @objc private func keyboardWillHide(sender: NSNotification) {    
    UIView.animate(withDuration: 0.1, animations: { () -> Void in
      self.liveConversationViewBottomConstraint.constant = 0
    })
  }
}
