//
//  WebsiteDescription.swift
//  Networking
//
//  Created by Maxim Bekmetov on 25.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

struct WebsiteDescription: Decodable {
    
    let websiteDesciption: String?
    let websiteName: String?
    let courses: [Course]?
}
