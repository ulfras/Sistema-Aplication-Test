//
//  MealsDetailPresenter.swift
//  Sistema Aplication Test
//
//  Created by Maulana Frasha on 09/08/22.
//

import UIKit
import Alamofire

protocol MealsDetailPresenterDelegate: AnyObject {
    func presentMealsDetail(mealsDetail: MealsDetailResponseModel)
}

typealias MealsDetailPresenterAlias = MealsDetailPresenterDelegate & UIViewController

class MealsDetailPresenter {
    weak var delegate: MealsDetailPresenterAlias?
    
    public func getMealsSeafoodDatabyID(mealsID: String) {
        let url = "https://www.themealdb.com/api/json/v1/1/lookup.php?i=\(mealsID)"
        AF.request(url).responseDecodable(of: MealsDetailResponseModel.self) { response in
            let mealsDetail = response.value
            self.delegate?.presentMealsDetail(mealsDetail: mealsDetail!)
        }
    }
    
    public func setViewDelegate(delegate: MealsDetailPresenterAlias) {
        self.delegate = delegate
    }
}
