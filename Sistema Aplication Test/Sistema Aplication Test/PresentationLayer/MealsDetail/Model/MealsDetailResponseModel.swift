//
//  MealsDetailResponseModel.swift
//  Sistema Aplication Test
//
//  Created by Maulana Frasha on 09/08/22.
//

struct MealsDetailResponseModel: Decodable {
    let meals: [Meal]?

    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}

struct Meal: Decodable {
    let strCategory: String?
    let strArea: String?
    let strInstructions: String?
    let strTags: String?
    let strYoutube: String?
    let strSource: String?

    enum CodingKeys: String, CodingKey {
        case strCategory = "strCategory"
        case strArea = "strArea"
        case strInstructions = "strInstructions"
        case strTags = "strTags"
        case strYoutube = "strYoutube"
        case strSource = "strSource"
    }
}
