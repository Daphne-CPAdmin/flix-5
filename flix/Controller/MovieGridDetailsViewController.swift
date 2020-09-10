//
//  MovieGridDetailsViewController.swift
//  flix
//
//  Created by admin on 9/9/20.
//  Copyright © 2020 MrugeshMaster. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridDetailsViewController: UIViewController {

    @IBOutlet weak var gridBackDropImage: UIImageView!
    @IBOutlet weak var gridPosterImage: UIImageView!
    @IBOutlet weak var gridTitleLabel: UILabel!
    @IBOutlet weak var gridMovieSynopsisLabel: UILabel!
    
    var movie:[String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        gridTitleLabel.text = movie["title"] as? String
        gridMovieSynopsisLabel.text = movie["overview"] as? String
        gridMovieSynopsisLabel.sizeToFit()
         //Display Movie image
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        let posterURL = URL(string: baseURL + posterPath)
        
        gridPosterImage!.af.setImage(withURL: posterURL!)
        //Display Movie image
        let backdropPath = movie["backdrop_path"] as! String
        let backdropURL = URL(string: "https://image.tmdb.org/t/p/w780" + backdropPath)
         
        gridBackDropImage!.af.setImage(withURL: backdropURL!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
