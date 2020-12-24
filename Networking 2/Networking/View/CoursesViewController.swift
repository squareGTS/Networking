//
//  CoursesViewController.swift
//  Networking
//
//  Created by Alexey Efimov on 06.09.2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class CoursesViewController: UIViewController {
    
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchData()
    }
    
    func fetchData() {
        //let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_course"
        //let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
        //let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_website_description"
        let jsonUrlString = "https://swiftbook.ru//wp-content/uploads/api/api_missing_or_wrong_fields"
        
        guard let url = URL(string: jsonUrlString)
        else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let safeData = data
            else { return }
            
            do {
                let websiteDescription = try JSONDecoder().decode(WebSiteDescription.self, from: safeData)
                print(websiteDescription)
            } catch let error{
                print("Error serilization json", error)
            }
            
        }.resume()
        
        
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

// MARK: Table View Data Source

extension CoursesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! TableViewCell
        
        return cell
    }
}

// MARK: Table View Delegate

extension CoursesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

