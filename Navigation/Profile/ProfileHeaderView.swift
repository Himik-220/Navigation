//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 04.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {
  
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    self.translatesAutoresizingMaskIntoConstraints = false
    self.addSubview(avatar)
    self.addSubview(nameLabel)
    self.addSubview(statusButton)
    self.addSubview(signatureLabel)
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if let strongSuperView = self.superview {
      NSLayoutConstraint.activate([
        self.heightAnchor.constraint(equalToConstant: 220),
        self.leftAnchor.constraint(equalTo: strongSuperView.leftAnchor, constant: 0),
        self.rightAnchor.constraint(equalTo: strongSuperView.rightAnchor, constant: 0),
        self.topAnchor.constraint(equalTo: strongSuperView.safeAreaLayoutGuide.topAnchor, constant: 0),
        
        avatar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0),
        avatar.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
        avatar.widthAnchor.constraint(equalToConstant: 150),
        avatar.heightAnchor.constraint(equalToConstant: 150),
        
        nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
        nameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
        
        statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16),
        statusButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
        statusButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
        statusButton.heightAnchor.constraint(equalToConstant: 50),
        
        signatureLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34),
        signatureLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor)])
    } else {
      print("not superview")
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
