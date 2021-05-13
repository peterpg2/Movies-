//
//  ViewController.swift
//  movies Peter
//
//  Created by period6 on 3/4/21.
//

import UIKit
import SafariServices

class ViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource{
   
 
    @IBOutlet weak var movieView: UITableView!
   
    var movies = ["Shawshank Redemtion", "Inception", "Joker", "The Godfather", "Super Bad"]
    var stars = ["4.6/5.0", "4.2/5.0", "3.8/5.0", "4.8/5.0", "4.3/5.0"]
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let url = URL(string: "https://www.rottentomatoes.com/m/" + movies[indexPath.row])
        let config = SFSafariViewController.Configuration()
        config.entersReaderIfAvailable = true
        
        
       
        let searchString = " "
        let replacementString = "_"
        var replacingOccurances = movies[indexPath.row].replacingOccurrences(of: searchString, with: replacementString)
        let newUrl = URL(string: "https://www.rottentomatoes.com/m/" + replacingOccurances)
       let vc = SFSafariViewController(url: newUrl!, configuration: config)
        print(newUrl)
        present(vc, animated: true)
      
      
        
        
        
    
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell" )
        cell?.textLabel?.text = movies[indexPath.row]
        cell?.detailTextLabel?.text = stars[indexPath.row]
        return cell!
    
        
          }
   
    @IBAction func pressButton(_ sender: Any) {
        alert()
    }
    func alert(){
        let alertController = UIAlertController(title: "HELLO", message: "Type In Your Favorite Movie", preferredStyle: .alert)
       
            let newAction: UIAlertAction = UIAlertAction(title: "CLICK ME", style: .default) { (action) in
            let moviesTF = alertController.textFields?.first?.text
                let starsTF = (alertController.textFields?.last?.text)!  + "/5.0"
                self.movies.append(moviesTF!)
                self.stars.append(starsTF)
                self.movieView.reloadData()
            }
        alertController.addTextField { (textField) -> Void in
            textField.placeholder = "Enter Movie"
        }
        alertController.addTextField { (textField) -> Void in
            textField.placeholder = "Enter Rating"
        }
        alertController.addAction(newAction)
        
            present(alertController, animated: true, completion: nil)
   
    
    
    }
}
    



