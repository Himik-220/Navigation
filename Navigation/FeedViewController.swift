//
//  ViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 25.11.2022.
//

import UIKit

class FeedViewController: UIViewController {
  
  let myButton = UIButton(frame: CGRect(x: 50, y: 100, width: 100, height: 50))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .tertiarySystemBackground
    myButton.setTitle("Post", for: .normal)
    myButton.setTitleColor(UIColor(named: "textColor"), for: .normal)
    myButton.backgroundColor = .systemBlue
    myButton.addTarget(self, action: #selector(goPost), for: .touchUpInside)
    view.addSubview(myButton)
  }
  @objc func goPost() {
    navigationController?.pushViewController(PostViewController(), animated: true)
  }
}
