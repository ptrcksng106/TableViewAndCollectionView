//
//  HomeTableViewModel.swift
//  TableViewAndCollectionView
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 21/08/24.
//

import Foundation

class HomeTableViewModel {
  var meals: [Meal] = []
  private let shared = APIClient.shared
  
  func fetchMealsList(completion: @escaping (Result<[Meal], Error>) -> Void) {
    Task {
      do {
        let mealsList = try await shared.getMealsList()
        self.meals = mealsList
        completion(.success(mealsList))
      } catch {
        completion (.failure(error))
      }
    }
  }
}
