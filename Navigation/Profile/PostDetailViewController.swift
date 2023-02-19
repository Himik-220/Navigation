//
//  PostDetailViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 15.02.2023.
//

import UIKit

class PostDetailViewController: UIViewController {
  
  let postDetailView = PostDetailUIScrollView()
  var postID = 0
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(postDetailView)
    Post.postData[postID].views += 1
    postDetailView.likesLabel.text = "Likes: \(Post.postData[postID].likes)"
    postDetailView.viewsLabel.text = "Views: \(Post.postData[postID].views)"
    postDetailView.image.image = UIImage(named: Post.postData[postID].image)
    postDetailView.descriptionLabel.text = Post.postData[postID].description
    postDetailView.authorLabel.text = Post.postData[postID].author
    postDetailView.likeButton.addTarget(self, action: #selector(tapLikes), for: .touchUpInside)
    view.backgroundColor = .systemBackground
  }
  
  @objc func tapLikes() {
    Post.postData[postID].likes += 1
    postDetailView.likesLabel.text = "Likes: \(Post.postData[postID].likes)"
  }
}
