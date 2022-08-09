//
//  MealsDetailViewController.swift
//  Sistema Aplication Test
//
//  Created by Maulana Frasha on 09/08/22.
//

import UIKit
import youtube_ios_player_helper
import SafariServices

class MealsDetailViewController: UIViewController, MealsDetailPresenterDelegate {
    
    @IBOutlet weak var ytVideoViewOutlet: YTPlayerView!
    @IBOutlet weak var mealsImageOutlet: UIImageView!
    @IBOutlet weak var mealsTagsLabelOutlet: UILabel!
    @IBOutlet weak var mealsAreaLabelOutlet: UILabel!
    @IBOutlet weak var mealsInstructionTextViewOutlet: UITextView!
    
    private let presenter = MealsDetailPresenter()
    private var mealsDetailData = MealsDetailResponseModel(meals: [])
    var mealsDetailID = String()
    var mealsImageURL = String()
    var mealsName = String()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        title = mealsName
        ytVideoViewOutlet.load(withVideoId: "https://www.youtube.com/watch?v=xvPR2Tfw5k0".youtubeID!)
        mealsImageOutlet.setImageFrom(mealsImageURL)
        mealsImageOutlet.layer.cornerRadius = 16
        mealsInstructionTextViewOutlet.layer.borderColor = UIColor.systemGray3.cgColor
        mealsInstructionTextViewOutlet.layer.borderWidth = 1
        mealsInstructionTextViewOutlet.layer.cornerRadius = 8
        presenter.getMealsSeafoodDatabyID(mealsID: mealsDetailID)
        presenter.setViewDelegate(delegate: self)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func presentMealsDetail(mealsDetail: MealsDetailResponseModel) {
        self.mealsDetailData = mealsDetail
        self.ytVideoViewOutlet.load(withVideoId: (self.mealsDetailData.meals?.first?.strYoutube?.youtubeID)!)
        self.mealsTagsLabelOutlet.text = self.mealsDetailData.meals?.first?.strTags
        self.mealsAreaLabelOutlet.text = "From \(self.mealsDetailData.meals?.first?.strArea ?? "")"
        self.mealsInstructionTextViewOutlet.text = "Instruction : \n\(self.mealsDetailData.meals?.first?.strInstructions ?? "")"
    }
    
    @IBAction func receiptWebSourceButtonTapIn(_ sender: Any) {
        let url = URL(string: (mealsDetailData.meals?.first?.strSource)!)
        let svc = SFSafariViewController(url: url!)
        present(svc, animated: true, completion: nil)
    }
    
}
