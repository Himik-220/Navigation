//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 28.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
  
  let header = ProfileHeaderView()
  
  override func viewDidLoad() {
      super.viewDidLoad()
    self.title = "Profile"
    view.backgroundColor = .lightGray
    view.addSubview(header)
  }
  
}
