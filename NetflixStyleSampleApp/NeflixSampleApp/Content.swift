//
//  Content.swift
//  NetflixStyleSampleApp
//
//  Created by 노민경 on 2022/01/10.
//

import UIKit

// Property list에 대한 decoding이 필요하므로 Decodable로 설정

struct Content: Decodable {
    let sectionType: SectionType
    let sectionName: String
    let contentItem: [Item]
    
    // basic, main, large, rank를 받더라도 똑같이 String으로 내뱉어 줌
    enum SectionType: String, Decodable { 
        case basic
        case main
        case large
        case rank
    }
}

struct Item: Decodable {
    let description: String
    let imageName: String
    
    var image: UIImage {
        return UIImage(named: imageName) ?? UIImage()
    }
}

