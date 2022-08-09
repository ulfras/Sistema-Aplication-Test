//
//  MealsListPresenter.swift
//  Sistema Aplication Test
//
//  Created by Maulana Frasha on 09/08/22.
//

import UIKit
import Alamofire

protocol MealsListPresenterDelegate: AnyObject {
    func presentMealsList(mealsList: MealsSeafoodResponseModel)
}

typealias PresenterDelegate = MealsListPresenterDelegate & UITableViewController

class MealsListPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getMealsSeafoodData() {
        let url = "https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood"
        AF.request(url).responseDecodable(of: MealsSeafoodResponseModel.self) { response in
            let mealsList = response.value
            self.delegate?.presentMealsList(mealsList: mealsList!)
        }
    }
    
    public func setViewDelegate(delegate: PresenterDelegate) {
        self.delegate = delegate
    }
}
