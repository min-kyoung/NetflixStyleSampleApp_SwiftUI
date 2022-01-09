//
//  ContentCollectionViewCell.swift
//  NetflixStyleSampleApp
//
//  Created by 노민경 on 2022/01/10.
//

import UIKit
import SnapKit

class ContentCollectionViewCell: UICollectionViewCell {
    let imageView = UIImageView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = .white
        contentView.layer.cornerRadius = 5
        contentView.clipsToBounds = true
        
        imageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(imageView)
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview() // imageView의 superview, 즉 contentView가 모든 엣지에 맞게 설정
        }
    }
}
