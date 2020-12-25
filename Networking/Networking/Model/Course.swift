//
//  Course.swift
//  Networking
//
//  Created by Maxim Bekmetov on 25.12.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import Foundation

struct Course: Decodable {
    
    let id: Int?
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
}
