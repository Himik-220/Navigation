//
//  PostDetailUIView.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 15.02.2023.
//

import UIKit

class PostDetailUIScrollView: UIScrollView {

  let authorLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
    label.textColor = UIColor(named: "textColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let descriptionLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 0
    label.lineBreakMode = .byWordWrapping
    label.font = UIFont(name: "System", size: 14)
    label.textColor = .systemGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let viewsLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = UIFont(name: "System", size: 16)
    label.textColor = UIColor(named: "textColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let likesLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = UIFont(name: "System", size: 16)
    label.textColor = UIColor(named: "textColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let likeButton: UIButton = {
    let button = UIButton()
    button.tintColor = UIColor(named: "textColor")
    button.setImage(UIImage(systemName: "heart.fill"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.tintColor = UIColor(named: "textColor")
    return button
  }()
  
  let image = UIImageView()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    self.addSubview(authorLabel)
    self.addSubview(descriptionLabel)
    self.addSubview(likesLabel)
    self.addSubview(viewsLabel)
    self.addSubview(image)
    self.addSubview(likeButton)
    self.translatesAutoresizingMaskIntoConstraints = false
    
    image.contentMode = .scaleAspectFit
    image.translatesAutoresizingMaskIntoConstraints = false
    image.backgroundColor = UIColor(named: "textColor")
  }
  
  override func layoutSubviews() {
    super.layoutSubviews()
    if let strongSuperview = superview {
      NSLayoutConstraint.activate([
        
        self.topAnchor.constraint(equalTo: strongSuperview.safeAreaLayoutGuide.topAnchor),
        self.leftAnchor.constraint(equalTo: strongSuperview.safeAreaLayoutGuide.leftAnchor),
        self.rightAnchor.constraint(equalTo: strongSuperview.safeAreaLayoutGuide.rightAnchor),
        self.bottomAnchor.constraint(equalTo: strongSuperview.safeAreaLayoutGuide.bottomAnchor),
        
        authorLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),
        authorLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        
        image.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
        image.widthAnchor.constraint(equalTo: self.widthAnchor),
        image.heightAnchor.constraint(equalTo: self.widthAnchor),
        
        descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
        descriptionLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        descriptionLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        descriptionLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 32),

        likeButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
        likeButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
        
        likesLabel.leftAnchor.constraint(equalTo: likeButton.rightAnchor, constant: 2),
        likesLabel.topAnchor.constraint(equalTo: likeButton.topAnchor),

        viewsLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
        viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
        viewsLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
      ])
    } else {
      print("Not superview")
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
