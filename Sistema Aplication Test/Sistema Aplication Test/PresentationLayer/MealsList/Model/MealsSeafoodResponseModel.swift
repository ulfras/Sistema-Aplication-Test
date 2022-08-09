//
//  MealsSeafoodResponseModel.swift
//  Sistema Aplication Test
//
//  Created by Maulana Frasha on 09/08/22.
//

struct MealsSeafoodResponseModel: Decodable {
    let meals: [Seafood]?

    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}

struct Seafood: Decodable {
    let strMeal: String?
    let strMealThumb: String?
    let idMeal: String?

    enum CodingKeys: String, CodingKey {
        case strMeal = "strMeal"
        case strMealThumb = "strMealThumb"
        case idMeal = "idMeal"
    }
}
