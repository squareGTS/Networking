//
//  ViewController.swift
//  Networking
//
//  Created by Alexey Efimov on 25/07/2018.
//  Copyright © 2018 Alexey Efimov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func getRequest(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else { return }
        
        let session = URLSession.shared
        session.dataTask(with: url) { (data, response, error) in
            guard
                let safeResponse = response,
                let safeData = data
            else { return }
            
            print(safeResponse)
            print(safeData)
            
            do {
                let json = try JSONSerialization.jsonObject(with: safeData, options: [])
                print(json)
            } catch {
                print(error)
            }
            
        }.resume()
    }
    
    @IBAction func postRequest(_ sender: Any) {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        else { return }
        
        let userData = ["Course" : "Networking", "Lesson" : "GET and POST Requests"]
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        guard let httpBody = try? JSONSerialization.data(withJSONObject: userData, options: [])
        else { return }
        request.httpBody = httpBody
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let session = URLSession.shared
        
        session.dataTask(with: request) { (data, response, error) in
            guard let safeResponse = response, let safeData = data
            else { return }
            
            print(safeResponse)
            
            do {
                let json = try JSONSerialization.jsonObject(with: safeData, options: [])
                print(json)
            } catch {
                print(error)
            }
        }.resume()
    }
}

