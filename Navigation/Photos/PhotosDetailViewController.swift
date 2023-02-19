//
//  PhotosDetailViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 15.02.2023.
//

import UIKit

class PhotosDetailViewController: UIViewController {
  
  var imageName = ""
  let image = UIImageView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(image)
    image.image = UIImage(named: imageName)
    image.translatesAutoresizingMaskIntoConstraints = false
    image.contentMode = .scaleAspectFit
    view.backgroundColor = .systemBackground
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    NSLayoutConstraint.activate([
      image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
      image.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8),
      image.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 8),
      image.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -8)
    ])
  }
  
}
