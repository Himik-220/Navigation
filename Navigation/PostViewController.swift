//
//  PostViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 28.11.2022.
//

import UIKit

class PostViewController: UIViewController {
  
//  let post = Post(title: "myPost")
  
  override func viewDidLoad() {
    super.viewDidLoad()
//    self.title = post.title
    view.backgroundColor = .white
    let barItem = UIBarButtonItem(title: nil, image: UIImage(systemName: "plus"), target: self, action: #selector(creatInfo))
    navigationItem.rightBarButtonItem = barItem
  }
  
  @objc func creatInfo() {
    navigationController?.show(InfoViewController(), sender: nil)
  }
}

