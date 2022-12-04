//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 04.12.2022.
//

import UIKit

class ProfileHeaderView: UIView {

  var avatar = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
  var nameLabel = UILabel()
  var statusButton = UIButton()
  var signatureLabel = UILabel()
  let status = "asdasd"
  
  init(){
    super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    createAvatar()
    createNameLabel()
    createStatusButton()
    createSignatureLabel()
    self.addSubview(avatar)
    self.addSubview(nameLabel)
    self.addSubview(statusButton)
    self.addSubview(signatureLabel)
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    if let strongSuperView = self.superview {
      self.frame = strongSuperView.frame
    }
    NSLayoutConstraint.activate(createConstraintsAvatar())
    NSLayoutConstraint.activate(createNameLabelConstraints())
    NSLayoutConstraint.activate(createStatusButtonConstraints())
    NSLayoutConstraint.activate(createSignatureLabelConstraints())
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  //MARK: Avatar
  private func createAvatar() {
    avatar.contentMode = .scaleToFill
    avatar.translatesAutoresizingMaskIntoConstraints = false
    avatar.layer.borderWidth = 3
    avatar.layer.borderColor = UIColor.white.cgColor
    avatar.layer.cornerRadius = avatar.frame.size.width / 2
    avatar.clipsToBounds = true
    avatar.image = UIImage(named: "avatar")
  }

  private func createConstraintsAvatar() -> [NSLayoutConstraint] {
    let top = avatar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0)
    let left = avatar.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16)
    let width = avatar.widthAnchor.constraint(equalToConstant: 150)
    let height = avatar.heightAnchor.constraint(equalToConstant: 150)
    return [top, left, width, height]
  }

  //MARK: NameLabel
  private func createNameLabel() {
    nameLabel.text = "Dog"
    nameLabel.numberOfLines = 1
    nameLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
    nameLabel.textColor = .black
    nameLabel.translatesAutoresizingMaskIntoConstraints = false
  }

  private func createNameLabelConstraints() -> [NSLayoutConstraint] {
    let top = nameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27)
    let left = nameLabel.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20)
    return [top, left]
  }

  //MARK: StatusButton
  private func createStatusButton() {
    statusButton.setTitle("Show status", for: .normal)
    statusButton.titleLabel?.textColor = .white
    statusButton.backgroundColor = .systemBlue
    statusButton.layer.cornerRadius = 4
    statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
    statusButton.layer.shadowRadius = 4
    statusButton.layer.shadowColor = UIColor.black.cgColor
    statusButton.layer.opacity = 0.7
    statusButton.translatesAutoresizingMaskIntoConstraints = false
    statusButton.addTarget(self, action: #selector(showStatus), for: .touchUpInside)
  }

  @objc func showStatus() {
    print(status)
  }

  private func createStatusButtonConstraints() -> [NSLayoutConstraint] {
    let top = statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 16)
    let left = statusButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16)
    let right = statusButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16)
    let height = statusButton.heightAnchor.constraint(equalToConstant: 50)
    return [top, left, right, height]
  }

  //MARK: SignatureLabel
  private func createSignatureLabel() {
    signatureLabel.text = "Waiting for something..."
    signatureLabel.numberOfLines = 1
    signatureLabel.font = UIFont(name: "System", size: 14)
    signatureLabel.textColor = .gray
    signatureLabel.translatesAutoresizingMaskIntoConstraints = false
  }

  private func createSignatureLabelConstraints() -> [NSLayoutConstraint] {
    let bottom = signatureLabel.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -34)
    let left = signatureLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor)
    return [bottom, left]
  }
}
