//
//  CollectionViewController.swift
//  TableViewAndCollectionView
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 21/08/24.
//

import UIKit

class CollectionViewController: UIViewController {
  
  private let viewModel: HomeTableViewModel
  
  init(viewModel: HomeTableViewModel) {
    self.viewModel = viewModel
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .vertical
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier)
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
}

extension CollectionViewController: UICollectionViewDataSource, UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    viewModel.meals.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as? CollectionViewCell else {
      return CollectionViewCell()
    }
//    cell.configureViews(let: viewModel.meals[indexPath.row])
    return cell
  }
}
