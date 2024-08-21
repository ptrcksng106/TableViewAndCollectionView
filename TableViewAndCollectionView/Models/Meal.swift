//
//  Meal.swift
//  TableViewAndCollectionView
//
//  Created by Patrick Samuel Owen Saritua Sinaga on 21/08/24.
//

import Foundation

struct MealData: Codable {
  let meals: [Meal]
}

struct Meal: Codable {
  let strMeal: String?
  let strMealThumb: String?
  let idMeal: String?
}
