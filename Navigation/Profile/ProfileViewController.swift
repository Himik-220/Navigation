//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 28.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
  
  let header = ProfileHeaderView()
  var someButton: UIButton = {
    let button = UIButton()
    button.setTitle("Some button", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.backgroundColor = .yellow
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Profile"
    view.backgroundColor = .systemGray6
    view.addSubview(header)
    view.addSubview(someButton)
    header.statusButton.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    NSLayoutConstraint.activate([
      someButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
      someButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
      someButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)])
  }
  
  @objc func showStatus() {
    print(header.signatureLabel.text ?? "")
  }
}
