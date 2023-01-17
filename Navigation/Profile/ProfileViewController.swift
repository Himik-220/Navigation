//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 28.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    self.tableView.delegate = self
    self.tableView.dataSource = self
    self.tableView.backgroundColor = .systemGray6
    view.backgroundColor = .systemGray6
    self.tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.cellID)
    self.tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.cellID)
    self.tableView.rowHeight = UITableView.automaticDimension
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    NSLayoutConstraint.activate([
      tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
      tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
      tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if section == 0 {
      return 1
    } else {
      return Post.postData.count
    }
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.cellID) as! PhotosTableViewCell
      return cell
    } else {
      let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellID) as! PostTableViewCell
      cell.authorLabel.text = Post.postData[indexPath.row].author
      cell.descriptionLabel.text = Post.postData[indexPath.row].description
      cell.likesLabel.text = "Likes: \(Post.postData[indexPath.row].likes)"
      cell.viewsLabel.text = "Views: \(Post.postData[indexPath.row].views)"
      cell.image.image = UIImage(named: Post.postData[indexPath.row].image)
      return cell
    }
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 0 {
      return ProfileTableHederView()
    } else {
      return nil
    }
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    if indexPath.section == 0 {
      navigationController?.pushViewController(PhotosViewController(), animated: true)
      navigationController?.navigationBar.isHidden = false
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if section == 0 {
      return 210
    } else {
      return 0
    }
  }
}

