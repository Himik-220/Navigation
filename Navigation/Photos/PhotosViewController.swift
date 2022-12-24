//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Leonid Shchipkov on 21.12.2022.
//

import UIKit

class PhotosViewController: UIViewController {
  
  let photosCollection: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collection.translatesAutoresizingMaskIntoConstraints = false
    collection.contentInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    collection.isPagingEnabled = true
    collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.cellID)
    return collection
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    self.title = "Photo Gallery"
    view.addSubview(photosCollection)
    photosCollection.dataSource = self
    photosCollection.delegate = self
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    NSLayoutConstraint.activate([
      photosCollection.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      photosCollection.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      photosCollection.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor),
      photosCollection.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor)
    ])
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    navigationController?.navigationBar.isHidden = true
  }
}

extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return Post.postData.count
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: (UIScreen.main.bounds.width - 36)/3, height: (UIScreen.main.bounds.width - 36)/3)
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.cellID, for: indexPath) as! PhotosCollectionViewCell
    cell.imageView.image = UIImage(named: Post.postData[indexPath.row].image)
    return cell
  }
}
