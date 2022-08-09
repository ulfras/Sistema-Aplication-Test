//
//  MealsSeafoodDetailResponseModel.swift
//  Sistema Aplication Test
//
//  Created by Maulana Frasha on 09/08/22.
//

struct MealsSeafoodDetailResponseModel: Codable {
    let meals: [[String: String?]]?

    enum CodingKeys: String, CodingKey {
        case meals = "meals"
    }
}
