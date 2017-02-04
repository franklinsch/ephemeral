//
//  LiveTextField.swift
//  Ephemerial-iOS
//
//  Created by Franklin Schrans on 2/4/17.
//  Copyright © 2017 Franklin Schrans. All rights reserved.
//

import UIKit

class LiveTextView: UITextView {
  
  override func awakeFromNib() {
    super.awakeFromNib()
    textAlignment = .center
  }
  
  override var contentSize: CGSize {
    didSet {
      var topCorrection = (bounds.size.height - contentSize.height * zoomScale) / 2.0
      topCorrection = max(0, topCorrection)
      contentInset = UIEdgeInsets(top: topCorrection, left: 0, bottom: 0, right: 0)
    }
  }
}
