//
//  WebSiteDescription.swift
//  Networking
//
//  Created by Maxim Bekmetov on 24.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

struct WebSiteDescription: Decodable {
    let websiteDescription: String?
    let websiteName: String?
    let courses: [Course]?
}
