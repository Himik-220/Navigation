//
//  TextFieldExtention.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 11.12.2022.
//

import UIKit

extension UITextField {
  func indent(size:CGFloat) {
    self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
    self.leftViewMode = .always
  }
}
