//
//  LogInViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 10.12.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate, UIGestureRecognizerDelegate {
  
  let logInScrollView = UIScrollView()
  
  let logoImage: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleToFill
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = UIImage(named: "logo")
    return image
  }()
  
  let loginTF: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Email or phone"
    tf.keyboardType = .emailAddress
    tf.font = UIFont(name: "System", size: 16)
    tf.backgroundColor = .systemGray6
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.layer.borderWidth = 0.5
    tf.layer.borderColor = UIColor.lightGray.cgColor
    tf.indent(size: 5)
    return tf
  }()
  
  let passwordTF: UITextField = {
    let tf = UITextField()
    tf.placeholder = "password"
    tf.isSecureTextEntry = true
    tf.font = UIFont(name: "System", size: 16)
    tf.backgroundColor = .systemGray6
    tf.translatesAutoresizingMaskIntoConstraints = false
    tf.indent(size: 5)
    return tf
  }()
  
  let myStackView: UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.layer.cornerRadius = 10
    stack.layer.borderColor = UIColor.lightGray.cgColor
    stack.layer.borderWidth = 0.5
    stack.backgroundColor = .systemGray6
    stack.layer.masksToBounds = true
    return stack
  }()
  
  let logInButton: UIButton = {
    let button = UIButton()
    button.setTitle("Log In", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 10
    button.backgroundColor = UIColor(named: "blueColor")
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let passwordLimitLabel: UILabel = {
    let label = UILabel()
    label.text = "минимальное количество символов 6"
    label.font = UIFont(name: "System", size: 14)
    label.textColor = .red
    label.isHidden = true
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .tertiarySystemBackground
    view.addSubview(logInScrollView)
    logInScrollView.addSubview(logoImage)
    logInScrollView.translatesAutoresizingMaskIntoConstraints = false
    logInScrollView.keyboardDismissMode = .interactive
    myStackView.addSubview(loginTF)
    myStackView.addSubview(passwordTF)
    logInScrollView.addSubview(passwordLimitLabel)
    logInScrollView.addSubview(logInButton)
    logInScrollView.addSubview(myStackView)
    
    loginTF.delegate = self
    passwordTF.delegate = self
    logInButton.addAction(UIAction{ [self] _ in
      if (loginTF.text != "" || passwordTF.text != "") && (loginTF.text == "Admin" || passwordTF.text == "123456"){
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
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    NSLayoutConstraint.activate([
      logInScrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      logInScrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
      logInScrollView.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
      logInScrollView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor),
      
      logoImage.topAnchor.constraint(equalTo: logInScrollView.topAnchor, constant: 120),
      logoImage.widthAnchor.constraint(equalToConstant: 100),
      logoImage.heightAnchor.constraint(equalToConstant: 100),
      logoImage.centerXAnchor.constraint(equalTo: logInScrollView.centerXAnchor),
      
      myStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
      myStackView.leftAnchor.constraint(equalTo: logInScrollView.leftAnchor, constant: 16),
      myStackView.rightAnchor.constraint(equalTo: logInScrollView.rightAnchor, constant: -16),
      myStackView.widthAnchor.constraint(equalTo: logInScrollView.widthAnchor, constant: -32),
      myStackView.heightAnchor.constraint(equalToConstant: 100),
      
      loginTF.topAnchor.constraint(equalTo: myStackView.topAnchor),
      loginTF.leftAnchor.constraint(equalTo: myStackView.leftAnchor),
      loginTF.rightAnchor.constraint(equalTo: myStackView.rightAnchor),
      loginTF.heightAnchor.constraint(equalToConstant: 50),
      
      passwordTF.topAnchor.constraint(equalTo: loginTF.bottomAnchor),
      passwordTF.leftAnchor.constraint(equalTo: myStackView.leftAnchor),
      passwordTF.rightAnchor.constraint(equalTo: myStackView.rightAnchor),
      passwordTF.heightAnchor.constraint(equalToConstant: 50),
      
      passwordLimitLabel.topAnchor.constraint(equalTo: myStackView.bottomAnchor, constant: -2),
      passwordLimitLabel.leftAnchor.constraint(equalTo: myStackView.leftAnchor),
      
      logInButton.topAnchor.constraint(equalTo: myStackView.bottomAnchor, constant: 16),
      logInButton.leftAnchor.constraint(equalTo: logInScrollView.leftAnchor, constant: 16),
      logInButton.rightAnchor.constraint(equalTo: logInScrollView.rightAnchor, constant: -16),
      logInButton.heightAnchor.constraint(equalToConstant: 50),
      logInButton.bottomAnchor.constraint(equalTo: logInScrollView.bottomAnchor, constant: -60)
    ])
  }
  
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    view.endEditing(true)
    if textField == passwordTF {
      if passwordTF.text?.count ?? 0 < 6 {
        passwordLimitLabel.isHidden = false
      } else {
        passwordLimitLabel.isHidden = true
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
    logInScrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: ks.height - self.view.safeAreaInsets.bottom + 20, right: 0)
  }
  
  @objc func keyboardWillHide(_ notrification: NSNotification) {
    logInScrollView.contentInset = .zero
  }
  
  @objc func hideKeyboardOnSwipeDown() {
    view.endEditing(true)
  }
  
  func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
    return true
  }
}
