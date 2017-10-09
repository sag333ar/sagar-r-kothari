//
//  ViewControllerCell.swift
//  nToDo
//
//  Created by sagar kothari on 09/10/17.
//  Copyright © 2017 Sagar R. Kothari. All rights reserved.
//

import UIKit

class ViewControllerCell: UITableViewCell {

  @IBOutlet weak var layoutConstraintLeftWidth: NSLayoutConstraint!
  @IBOutlet weak var layoutConstraintRightWidth: NSLayoutConstraint!

  func animateListView() {
    self.setNeedsUpdateConstraints()
    UIView.animate(withDuration: 0.25, animations: {
      self.layoutIfNeeded()
    }, completion: nil)
  }

  @objc func swipeLeft() {
    if layoutConstraintLeftWidth.constant > 0 {
      layoutConstraintLeftWidth.constant = 0
    } else {
      layoutConstraintRightWidth.constant = 50
    }
    animateListView()
  }

  @objc func swipeRight() {
    if layoutConstraintRightWidth.constant > 0 {
      layoutConstraintRightWidth.constant = 0
    } else {
      layoutConstraintLeftWidth.constant = 50
    }
    animateListView()
  }

  @objc func tapGesture() {
    layoutConstraintLeftWidth.constant = 0
    layoutConstraintRightWidth.constant = 0
    animateListView()
  }

  override func awakeFromNib() {
    super.awakeFromNib()
    let swipeLeft = UISwipeGestureRecognizer(target: self,
                                             action: #selector(ViewControllerCell.swipeLeft))
    swipeLeft.direction = .left
    self.addGestureRecognizer(swipeLeft)
    let swipeRight = UISwipeGestureRecognizer(target: self,
                                             action: #selector(ViewControllerCell.swipeRight))
    swipeRight.direction = .right
    self.addGestureRecognizer(swipeRight)

    let tapG = UITapGestureRecognizer(target: self,
                                      action: #selector(ViewControllerCell.tapGesture))
    tapG.numberOfTapsRequired = 1
    self.addGestureRecognizer(tapG)
  }

  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }

}
