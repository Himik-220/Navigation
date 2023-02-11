//
//  Post.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 28.11.2022.
//

import Foundation

struct Post {
  var author: String
  var description: String
  var image: String
  var likes: Int
  var views: Int
  
  static var postData = [
    Post(author: "Abc some asa, asdasda , asdas da ,asf asfas f,asfas sfa s", description: "some text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some textsome text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some textsome text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some textsome text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some textsome text some text some text some text some text some text some text some text some text some text some text some text some text some text some text some text",
         image: "one", likes: 232, views: 301),
    Post(author: "Bcd", description: "some text", image: "two", likes: 312, views: 600),
    Post(author: "Cde", description: "some text", image: "three", likes: 502, views: 1002),
    Post(author: "Def", description: "some text", image: "four", likes: 201, views: 202),
    Post(author: "Efg", description: "some text", image: "five", likes: 1520, views: 2000)
  ]
}
