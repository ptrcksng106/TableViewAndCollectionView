//
//  CollectionViewCell.swift
//  TableViewAndCollectionView
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 21/08/24.
//

import Kingfisher
import UIKit

class CollectionViewCell: UICollectionViewCell {
  static let identifier = "CollectionViewCell"
  
  private lazy var mealImage: UIImageView = {
    let img = UIImageView()
    img.contentMode = .scaleAspectFill
    img.clipsToBounds = true
    img.translatesAutoresizingMaskIntoConstraints = false
    return img
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setConstraint()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setConstraint() {
    contentView.addSubview(mealImage)
    
    NSLayoutConstraint.activate([
      mealImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      mealImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      mealImage.heightAnchor.constraint(equalToConstant: 150),
      mealImage.widthAnchor.constraint(equalToConstant: 150),
      mealImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
    ])
  }
  
  func configureViews(let item: Meal) {
    mealImage.kf.setImage(with: URL(string: item.strMealThumb ?? ""))
  }
}
