//
//  MealsSeafoodAPI.swift
//  Sistema Aplication Test
//
//  Created by Maulana Frasha on 09/08/22.
//

import Alamofire

class SistemaMealsAPI {
    
    func getMealsSeafoodDatabyID(mealsID: Int, completionHandler: @escaping(Result<MealsSeafoodDetailResponseModel, AFError>) -> Void) {
        let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealsID)"
        AF.request(url).responseDecodable(of: MealsSeafoodDetailResponseModel.self) { response in
            (completionHandler(response.result))
        }
    }
}
