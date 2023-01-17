//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 04.12.2022.
//

import UIKit

class ProfileTableHederView: UIView {
  
  var widthAvatarConstraint: NSLayoutConstraint!
  var heightAvatarConstraint: NSLayoutConstraint!
  var topAvatarConstraint: NSLayoutConstraint!
  var leftAvatarConstraint: NSLayoutConstraint!
  var centerYAvatarConstraint: NSLayoutConstraint!
  var centerXAvatarConstraint: NSLayoutConstraint!
  
  var avatar: UIImageView = {
    let image = UIImageView()
    image.contentMode = .scaleToFill
    image.translatesAutoresizingMaskIntoConstraints = false
    image.layer.borderWidth = 3
    image.layer.borderColor = UIColor.white.cgColor
    image.layer.cornerRadius = 150/2
    image.clipsToBounds = true
    image.image = UIImage(named: "avatar")
    return image
  }()
  
  var nameLabel: UILabel = {
    let label = UILabel()
    label.text = "Dog"
    label.numberOfLines = 1
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var statusButton: UIButton = {
    let button = UIButton()
    button.setTitle("Show status", for: .normal)
    button.titleLabel?.textColor = .white
    button.backgroundColor = .systemBlue
    button.layer.shadowColor = UIColor.black.cgColor
    button.layer.cornerRadius = 4
    button.layer.shadowOffset = CGSize(width: 4, height: 4)
    button.layer.opacity = 0.7
    button.layer.shadowOpacity = 1
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  var signatureLabel: UILabel = {
    let label = UILabel()
    label.text = "Waiting for something..."
    label.numberOfLines = 1
    label.font = UIFont(name: "System", size: 14)
    label.textColor = .gray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  var exitButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(systemName: "clear.fill"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.alpha = 0
    return button
  }()
  
  var bottomAvatarView: UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    view.backgroundColor = .systemGray6
    view.alpha = 0
    return view
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(avatar)
    self.addSubview(nameLabel)
    self.addSubview(statusButton)
    self.addSubview(signatureLabel)
    self.backgroundColor = .systemGray6
    statusButton.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
    avatar.isUserInteractionEnabled = true
    self.avatar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(onTap)))
    statusButton.addSubview(bottomAvatarView)
    self.addSubview(exitButton)
    exitButton.addTarget(self, action: #selector(exit), for: .touchUpInside)
    
    widthAvatarConstraint = avatar.widthAnchor.constraint(equalToConstant: 150)
    widthAvatarConstraint.isActive = true
    heightAvatarConstraint = avatar.heightAnchor.constraint(equalToConstant: 150)
    heightAvatarConstraint.isActive = true
    topAvatarConstraint = avatar.topAnchor.constraint(equalTo: self.topAnchor)
    leftAvatarConstraint = avatar.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16)
    topAvatarConstraint.isActive = true
    leftAvatarConstraint.isActive = true
    centerXAvatarConstraint = avatar.centerXAnchor.constraint(equalTo: self.centerXAnchor)
  }
  
  @objc func showStatus() {
    print(signatureLabel.text ?? "")
  }
  
  @objc func exit() {
    widthAvatarConstraint.constant = 150
    heightAvatarConstraint.constant = 150
    centerYAvatarConstraint.isActive = false
    centerXAvatarConstraint.isActive = false
    topAvatarConstraint.isActive = true
    leftAvatarConstraint.isActive = true
    UIView.animate(withDuration: 0.5) {
      self.layoutIfNeeded()
      self.bottomAvatarView.alpha = 0
    }
    UIView.animate(withDuration: 0.3, delay: 0.5){
      self.exitButton.alpha = 0
    }
  }
  
  @objc func onTap(_ tapRecognizer: UITapGestureRecognizer) {
    widthAvatarConstraint.constant = UIScreen.main.bounds.width
    heightAvatarConstraint.constant = UIScreen.main.bounds.width
    centerYAvatarConstraint = avatar.centerYAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.centerYAnchor)
    topAvatarConstraint.isActive = false
    leftAvatarConstraint.isActive = false
    centerYAvatarConstraint.isActive = true
    centerXAvatarConstraint.isActive = true
    UIView.animate(withDuration: 0.5) {
      self.layoutIfNeeded()
      self.bottomAvatarView.alpha = 0.8
    }
    UIView.animate(withDuration: 0.3, delay: 0.5){
      self.exitButton.alpha = 1
    }
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if let strongSuperview = superview {
      NSLayoutConstraint.activate([
        self.widthAnchor.constraint(equalTo: strongSuperview.safeAreaLayoutGuide.widthAnchor),
        self.centerXAnchor.constraint(equalTo: strongSuperview.centerXAnchor),
        self.topAnchor.constraint(equalTo: strongSuperview.topAnchor),
        
        nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
        nameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
        
        statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
        statusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        statusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        statusButton.heightAnchor.constraint(equalToConstant: 50),
        statusButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16),
        
        signatureLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
        signatureLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
        
        bottomAvatarView.topAnchor.constraint(equalTo: avatar.bottomAnchor),
        bottomAvatarView.centerXAnchor.constraint(equalTo: avatar.centerXAnchor),
        bottomAvatarView.bottomAnchor.constraint(equalTo: strongSuperview.safeAreaLayoutGuide.bottomAnchor),
        bottomAvatarView.widthAnchor.constraint(equalTo: avatar.widthAnchor),
      
        exitButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
        exitButton.rightAnchor.constraint(equalTo: avatar.rightAnchor, constant: -12)])
    } else {
      print("Not superview")
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
