//
//  HomeTableViewCell.swift
//  TableViewAndCollectionView
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 21/08/24.
//

import Kingfisher
import UIKit

class HomeTableViewCell: UITableViewCell {
  
  static let identifier = "HomeTableViewCell"
  
  private lazy var title: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
  }()
  
  private lazy var mealImage: UIImageView = {
    let img = UIImageView()
    img.contentMode = .scaleAspectFill
    img.clipsToBounds = true
    img.translatesAutoresizingMaskIntoConstraints = false
    return img
  }()
  
  private lazy var idText: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setConstraint()
  }
  
  private func setConstraint() {
    contentView.addSubview(title)
    contentView.addSubview(mealImage)
    contentView.addSubview(idText)
    
    NSLayoutConstraint.activate([
      mealImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
      mealImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      mealImage.heightAnchor.constraint(equalToConstant: 150),
      mealImage.widthAnchor.constraint(equalToConstant: 150),
      mealImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
      
      idText.leadingAnchor.constraint(equalTo: mealImage.trailingAnchor, constant: 8),
      idText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
      idText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
      
      title.leadingAnchor.constraint(equalTo: mealImage.trailingAnchor, constant: 8),
      title.topAnchor.constraint(equalTo: idText.bottomAnchor, constant: 16),
      title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
    ])
  }
  
  func configureViews(let item: Meal) {
    title.text = item.strMeal
    idText.text = item.idMeal
    mealImage.kf.setImage(with: URL(string: item.strMealThumb ?? ""))
  }
}
