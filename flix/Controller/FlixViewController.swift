//
//  FlixViewController.swift
//  flix
//
//  Created by admin on 8/30/20.
//  Copyright © 2020 MrugeshMaster. All rights reserved.
//

import UIKit
import AlamofireImage

class FlixViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var moviesArray: [[String:Any?]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        getAPIData()
    }
    
    func getAPIData() {
        API.getMovies() { (movies) in
            guard let movies = movies else {
                return
            }
            self.moviesArray = movies
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FlixCell") as! FlixCell
        
        let movie = moviesArray[indexPath.row]
        
        //Display Movie name
        cell.movieName.text = movie["title"] as? String ?? ""
        
        //Display Movie Description
        cell.movieDescription.text = movie["overview"] as? String ?? ""
        
        //Display Movie image
        let baseURL = "https://image.tmdb.org/t/p/w185"
        let posterPath = movie["poster_path"] as! String
        
        let posterURL = URL(string: baseURL + posterPath)
        
        cell.imageView!.af.setImage(withURL: posterURL!)
        
        return cell
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        let cell = sender as! UITableViewCell
        let indexPath = tableView.indexPath(for: cell)!
        let movie = moviesArray[indexPath.row]
        let detailsViewController = segue.destination as! MovieDetailsViewController
        detailsViewController.movie = movie as [String : Any]
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
