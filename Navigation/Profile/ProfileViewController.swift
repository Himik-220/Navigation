//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 28.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {
  
  let postData = [
    Post(author: "Abc some asa, asdasda , asdas da ,asf asfas f,asfas sfa s", description: "some text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some textsome text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some textsome text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some textsome text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some textsome text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some text",
         image: "one", likes: 232, views: 301),
    Post(author: "Bcd", description: "some text", image: "two", likes: 312, views: 600),
    Post(author: "Cde", description: "some text", image: "three", likes: 502, views: 1002),
    Post(author: "Def", description: "some text", image: "four", likes: 201, views: 202),
    Post(author: "Efg", description: "some text", image: "five", likes: 1520, views: 2000)
  ]
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    self.tableView.delegate = self
    self.tableView.dataSource = self
    tableView.backgroundColor = .systemGray6
    view.backgroundColor = .systemGray6
    self.tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.cellID)
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
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return postData.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.cellID) as! PostTableViewCell
    cell.authorLabel.text = postData[indexPath.row].author
    cell.descriptionLabel.text = postData[indexPath.row].description
    cell.likesLabel.text = "Likes: \(postData[indexPath.row].likes)"
    cell.viewsLabel.text = "Wiews: \(postData[indexPath.row].views)"
    cell.image.image = UIImage(named: postData[indexPath.row].image)
    return cell
  }
  
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    if section == 0 {
      return ProfileTableHederView()
    } else {
      return nil
    }
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 220
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
}
