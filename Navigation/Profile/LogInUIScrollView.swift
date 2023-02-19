//
//  LogInUIView.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 10.12.2022.
//

import UIKit

class LogInUIScrollView: UIScrollView {

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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.addSubview(logoImage)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.keyboardDismissMode = .interactive
    myStackView.addSubview(loginTF)
    myStackView.addSubview(passwordTF)
    self.addSubview(passwordLimitLabel)
    self.addSubview(logInButton)
    self.addSubview(myStackView)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if let strongSuperview = superview {
      NSLayoutConstraint.activate([
        self.topAnchor.constraint(equalTo: strongSuperview.safeAreaLayoutGuide.topAnchor),
        self.leftAnchor.constraint(equalTo: strongSuperview.safeAreaLayoutGuide.leftAnchor),
        self.widthAnchor.constraint(equalTo: strongSuperview.safeAreaLayoutGuide.widthAnchor),
        self.heightAnchor.constraint(equalTo: strongSuperview.safeAreaLayoutGuide.heightAnchor),
        
        logoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
        logoImage.widthAnchor.constraint(equalToConstant: 100),
        logoImage.heightAnchor.constraint(equalToConstant: 100),
        logoImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
        
        myStackView.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 120),
        myStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        myStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        myStackView.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -32),
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
        logInButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        logInButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        logInButton.heightAnchor.constraint(equalToConstant: 50),
        logInButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -60)
      ])
    } else {
      print("not superview")
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
