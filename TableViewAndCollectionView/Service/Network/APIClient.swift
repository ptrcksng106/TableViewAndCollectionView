//
//  APIClient.swift
//  TableViewAndCollectionView
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 21/08/24.
//

import Foundation

final class APIClient {
  static let shared = APIClient()
  
  func getMealsList() async throws -> [Meal] {
    let url = URL(string: "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood")
    
    guard let url = url else {
      throw URLError(.badURL)
    }
    
    let (data, response) = try await URLSession.shared.data(from: url)
    
    guard let httpResponse = response as? HTTPURLResponse else {
      throw URLError(.badServerResponse)
    }
    
    guard (200...299).contains(httpResponse.statusCode) else {
      throw URLError(.init(rawValue: httpResponse.statusCode))
    }
    
    let meals = try JSONDecoder().decode(MealData.self, from: data)
    return meals.meals
  }
}
