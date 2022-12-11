//
//  LogInViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 10.12.2022.
//

import UIKit

class LogInViewController: UIViewController {
  
  let logInView = LogInUIScrollView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .tertiarySystemBackground
    view.addSubview(logInView)
    logInView.logInButton.addAction(UIAction{ _ in
      self.navigationController?.pushViewController(ProfileViewController(), animated: true)
    }, for: .touchUpInside)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    subscribeKeyboardEvents()
  }
  
  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    NotificationCenter.default.removeObserver(self)
  }
  
  func subscribeKeyboardEvents() {
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                           name:UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                           name: UIResponder.keyboardWillHideNotification, object: nil)
  }
  
  @objc func keyboardWillShow(_ notification: NSNotification) {
    guard let ks = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey]
                    as? NSValue)?.cgRectValue else { return }
    logInView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)
  }
  
  @objc func keyboardWillHide(_ notrification: NSNotification) {
    logInView.contentInset = .zero
  }
}
