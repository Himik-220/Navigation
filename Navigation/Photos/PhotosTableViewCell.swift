//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 21.12.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
  
  static let cellID = "photosCell"
  
  let photosLabel: UILabel = {
    let label = UILabel()
    label.numberOfLines = 1
    label.font = UIFont(name: "HelveticaNeue-Bold", size: 24)
    label.textColor = UIColor(named: "textColor")
    label.translatesAutoresizingMaskIntoConstraints = false
    label.text = "Photos"
    return label
  }()
  
  let imageArrow = UIImageView(image: UIImage(systemName: "arrow.right"))
  let imageOne = UIImageView(image: UIImage(named: "one"))
  let imageTwo = UIImageView(image: UIImage(named: "two"))
  let imageThree = UIImageView(image: UIImage(named: "three"))
  let imageFour = UIImageView(image: UIImage(named: "four"))
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    imageOne.layer.cornerRadius = 6
    imageOne.clipsToBounds = true
    imageOne.translatesAutoresizingMaskIntoConstraints = false
    imageOne.contentMode = .scaleToFill
    imageTwo.layer.cornerRadius = 6
    imageTwo.clipsToBounds = true
    imageTwo.translatesAutoresizingMaskIntoConstraints = false
    imageTwo.contentMode = .scaleToFill
    imageThree.layer.cornerRadius = 6
    imageThree.clipsToBounds = true
    imageThree.translatesAutoresizingMaskIntoConstraints = false
    imageThree.contentMode = .scaleToFill
    imageFour.layer.cornerRadius = 6
    imageFour.clipsToBounds = true
    imageFour.translatesAutoresizingMaskIntoConstraints = false
    imageFour.contentMode = .scaleToFill
    imageArrow.translatesAutoresizingMaskIntoConstraints = false
    imageArrow.tintColor = UIColor(named: "textColor")
    
    contentView.addSubview(photosLabel)
    contentView.addSubview(imageOne)
    contentView.addSubview(imageTwo)
    contentView.addSubview(imageThree)
    contentView.addSubview(imageFour)
    contentView.addSubview(imageArrow)
    
    NSLayoutConstraint.activate([
      photosLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
      photosLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),

      imageArrow.centerYAnchor.constraint(equalTo: photosLabel.centerYAnchor),
      imageArrow.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),

      imageOne.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
      imageOne.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
      imageOne.topAnchor.constraint(equalTo: photosLabel.bottomAnchor, constant: 12),
      imageOne.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 12),
      imageOne.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),

      imageTwo.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
      imageTwo.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
      imageTwo.leftAnchor.constraint(equalTo: imageOne.rightAnchor, constant: 8),
      imageTwo.centerYAnchor.constraint(equalTo: imageOne.centerYAnchor),

      imageThree.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
      imageThree.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
      imageThree.leftAnchor.constraint(equalTo: imageTwo.rightAnchor, constant: 8),
      imageThree.centerYAnchor.constraint(equalTo: imageOne.centerYAnchor),

      imageFour.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
      imageFour.heightAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.25, constant: -12),
      imageFour.leftAnchor.constraint(equalTo: imageThree.rightAnchor, constant: 8),
      imageFour.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -12),
      imageFour.centerYAnchor.constraint(equalTo: imageOne.centerYAnchor)
    ])
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func awakeFromNib() {
    super.awakeFromNib()
    
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
  }
  
}
