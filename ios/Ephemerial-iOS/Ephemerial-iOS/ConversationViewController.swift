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
  
  @IBOutlet weak var liveConversationViewBottomConstraint: NSLayoutConstraint!
  
  // MARK: Setup
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpKeyboardNotifications()
  }
  
  private func setUpKeyboardNotifications() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(sender:)), name: .UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(sender:)), name: .UIKeyboardWillHide, object: nil)
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
  
  extension ConversationViewController: UITableViewDataSource, UITableViewDelegate {
    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
      cell.textLabel?.text = "hello"
      return cell
    }
  }
