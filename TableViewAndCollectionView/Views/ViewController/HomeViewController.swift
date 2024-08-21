//
//  HomeViewController.swift
//  TableViewAndCollectionView
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 21/08/24.
//

import UIKit

class HomeViewController: UIViewController {
  
  private lazy var tblView: UITableView = {
    let tblView = UITableView()
    tblView.translatesAutoresizingMaskIntoConstraints = false
    tblView.register(HomeTableViewCell.self, forCellReuseIdentifier: HomeTableViewCell.identifier)
    return tblView
  }()
  
  private let viewModel: HomeTableViewModel
  
  init(viewModel: HomeTableViewModel) {
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tblView.dataSource = self
    tblView.delegate = self
    
    
    configureDataSource()
    setConstraint()
  }
  
  private func setConstraint() {
    view.addSubview(tblView)
    NSLayoutConstraint.activate([
      tblView.topAnchor.constraint(equalTo: view.topAnchor),
      tblView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      tblView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      tblView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
    ])
  }
  
  private func configureDataSource() {
    viewModel.fetchMealsList { [weak self] result in
      switch result {
      case .success(let meal):
        //        self?.viewModel.meals = meal
        print("Fetched \(meal)")
        DispatchQueue.main.async {
          self?.tblView.reloadData()
        }
      case .failure(let error):
        print("Failed to fetch \(error)")
      }
    }
  }
}

extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    viewModel.meals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.identifier, for: indexPath) as? HomeTableViewCell else {
      return UITableViewCell()
    }
    cell.configureViews(let: viewModel.meals[indexPath.row])
    return cell
  }
}
