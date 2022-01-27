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
        
        // UICollectionViewCell의 경우 cell의 레이아웃을 표현할 때 contentView라는 기본 객체에 설정한다.
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
