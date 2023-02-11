//
//  InfoViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 28.11.2022.
//

import UIKit

class InfoViewController: UIViewController {
  
  let myBytton = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 50))
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .gray
    myBytton.setTitle("alert", for: .normal)
    myBytton.setTitleColor(UIColor(named: "textColor"), for: .normal)
    myBytton.backgroundColor = .red
    view.addSubview(myBytton)
    myBytton.addTarget(self, action: #selector(goAlert), for: .touchUpInside)
  }
  
  @objc func goAlert() {
    let alert = UIAlertController(title: "", message: navigationController?.viewControllers[1].title, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Да", style: .default, handler: { _ in
      print("Press Да")
    }))
    alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: {_ in
      print("Press Отмена")
    }))
    self.present(alert, animated: true)
  }
}
