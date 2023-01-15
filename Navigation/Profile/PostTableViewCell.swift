//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 17.12.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
  
  static let cellID = "PostCell"
  
  let authorLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 2
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 20)
    label.textColor = .black
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
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let likesLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = UIFont(name: "System", size: 16)
    label.textColor = .black
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let image = UIImageView()
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    contentView.addSubview(authorLabel)
    contentView.addSubview(descriptionLabel)
    contentView.addSubview(likesLabel)
    contentView.addSubview(viewsLabel)
    contentView.addSubview(image)
    
    image.contentMode = .scaleAspectFit
    image.translatesAutoresizingMaskIntoConstraints = false
    image.backgroundColor = .black
    
    NSLayoutConstraint.activate([
      authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      authorLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
      authorLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
      
      image.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 12),
      image.widthAnchor.constraint(equalTo: contentView.widthAnchor),
      image.heightAnchor.constraint(equalTo: contentView.widthAnchor),
      
      descriptionLabel.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 16),
      descriptionLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
      descriptionLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),

      likesLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
      likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),

      viewsLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
      viewsLabel.topAnchor.constraint(equalTo: likesLabel.topAnchor),
      viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    // Configure the view for the selected state
  }
}
