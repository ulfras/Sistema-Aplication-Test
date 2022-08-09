//
//  MealsListViewController.swift
//  Sistema Aplication Test
//
//  Created by Maulana Frasha on 09/08/22.
//

import UIKit

class MealsListViewController: UITableViewController, MealsListPresenterDelegate {
    
    @IBOutlet var mealsListTableViewOutlet: UITableView!
    
    private let presenter = MealsListPresenter()
    private var mealsListData = MealsSeafoodResponseModel(meals: [])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Meals List"
        mealsListTableViewOutlet.register(UINib(nibName: "MealsListTableViewCell", bundle: nil), forCellReuseIdentifier: "MealsListCell")
        
        presenter.getMealsSeafoodData()
        presenter.setViewDelegate(delegate: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func presentMealsList(mealsList: MealsSeafoodResponseModel) {
        self.mealsListData = mealsList
        self.mealsListTableViewOutlet.reloadData()
    }
    
}

extension MealsListViewController {
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mealsListData.meals!.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: "MealsListCell", for: indexPath)
        
        guard let cell = reusableCell as? MealsListTableViewCell else {
            return reusableCell
        }
        
        let mealsListDataCell = mealsListData.meals![indexPath.row]
        cell.mealsImageOutlet.setImageFrom(mealsListDataCell.strMealThumb!)
        cell.mealsNameLabelOutlet.text = mealsListDataCell.strMeal
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mealsListDataCell = mealsListData.meals![indexPath.row]
        let mealsDetailViewController = UIStoryboard(name: "MealsDetailViewController", bundle: nil).instantiateViewController(withIdentifier: "MealsDetailViewController") as! MealsDetailViewController
        mealsDetailViewController.mealsDetailID = mealsListDataCell.idMeal!
        mealsDetailViewController.mealsImageURL = mealsListDataCell.strMealThumb!
        mealsDetailViewController.mealsName = mealsListDataCell.strMeal!
        self.navigationController?.pushViewController(mealsDetailViewController, animated: true)
    }
}
