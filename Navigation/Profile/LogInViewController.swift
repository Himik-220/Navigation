//
//  LogInViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 10.12.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
  
  let logInView = LogInUIScrollView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .tertiarySystemBackground
    view.addSubview(logInView)
    logInView.loginTF.delegate = self
    logInView.passwordTF.delegate = self
    logInView.logInButton.addAction(UIAction{ [self] _ in
      if (logInView.loginTF.text != "" || logInView.passwordTF.text != "") && (logInView.loginTF.text == "Admin" || logInView.passwordTF.text == "123456"){
        self.navigationController?.pushViewController(ProfileViewController(), animated: true)
      } else {
        let alert = UIAlertController(title: "Неверный логин или пароль", message: "Поля логина и пароля не могут быть пустыми", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default))
        self.present(alert, animated: true)
      }
    }, for: .touchUpInside)
    let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(self.hideKeyboardOnSwipeDown))
    swipeDown.delegate = self
    swipeDown.direction =  UISwipeGestureRecognizer.Direction.down
    view.addGestureRecognizer(swipeDown)
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    if textField == logInView.passwordTF {
      if logInView.passwordTF.text?.count ?? 0 < 6 {
        logInView.passwordLimitLabel.isHidden = false
      } else {
        logInView.passwordLimitLabel.isHidden = true
      }
      return false
    }
    return false
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
  
  @objc func hideKeyboardOnSwipeDown() {
    view.endEditing(true)
  }
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
}
