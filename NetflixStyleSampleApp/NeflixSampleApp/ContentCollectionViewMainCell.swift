//
//  ContentCollectionViewMainCell.swift
//  NetflixStyleSampleApp
//
//  Created by 노민경 on 2022/01/12.
//

import UIKit

class ContentCollectionViewMainCell: UICollectionViewCell {
    let baseStackView = UIStackView()
    let menuStackView = UIStackView()
    
    let btnTV = UIButton()
    let btnMovie = UIButton()
    let btnCategory = UIButton()
    
    let imageView = UIImageView()
    let descriptionLabel = UILabel()
    let contentStackView = UIStackView()
    
    let btnPlus = UIButton()
    let btnPlay = UIButton()
    let btnInfo = UIButton()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        [baseStackView, menuStackView].forEach {
            contentView.addSubview($0)
        }
        
        // baseStackView layout
        baseStackView.axis = .vertical // 축
        baseStackView.alignment = .center
        baseStackView.distribution = .fillProportionally
        baseStackView.spacing = 5
        
        // baseStackView - imageView 추가
        [imageView, descriptionLabel, contentStackView].forEach {
            baseStackView.addArrangedSubview($0)
        }
        
        // imageView 설정
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints {
            $0.width.top.leading.trailing.equalToSuperview()
            $0.height.equalTo(imageView.snp.width) // 너비와 높이가 같은 1:1의 정사각형 모양
        }
        
        // baseStackView - descriptionLabel
        descriptionLabel.font = .systemFont(ofSize: 13)
        descriptionLabel.textColor = .white
        descriptionLabel.sizeToFit()
        
        // baseStackView - contentStackView
        contentStackView.axis = .horizontal
        contentStackView.alignment = .center
        contentStackView.distribution = .equalCentering
        contentStackView.spacing = 20
        
        // contentStackView autolayout
        contentStackView.snp.makeConstraints {
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        // contentStackView에 서브 요소 추가
        [btnPlus, btnInfo].forEach {
            $0.titleLabel?.font = .systemFont(ofSize: 13)
            $0.setTitleColor(.white, for: .normal)
            $0.imageView?.tintColor = .white
            $0.adjustVerticalLayout(5)
        }
        
        btnPlus.setTitle("내가 찜한 컨텐츠", for: .normal)
        btnPlus.setImage(UIImage(systemName: "plus"), for: .normal)
        btnPlus.addTarget(self, action: #selector(btnPlusTapped), for: .touchUpInside)
        
        btnInfo.setTitle("정보", for: .normal)
        btnInfo.setImage(UIImage(systemName: "info.circle"), for: .normal)
        btnInfo.addTarget(self, action: #selector(btnInfoTapped), for: .touchUpInside)
        
        btnPlay.setTitle("재생", for: .normal)
        btnPlay.setTitleColor(.blue, for: .normal)
        btnPlay.backgroundColor = .white
        btnPlay.layer.cornerRadius = 3
        btnPlay.snp.makeConstraints {
            $0.width.equalTo(90)
            $0.height.equalTo(30)
        }
        btnPlay.addTarget(self, action: #selector(btnPlayTapped), for: .touchUpInside)
        
        // baseStackView - contentStackView에 버튼 추가
        [btnPlus, btnPlay, btnInfo].forEach {
            contentStackView.addArrangedSubview($0)
            
        }
        
        // baseStackView autolayout
        baseStackView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(30)
            $0.height.equalTo(60)
        }
        
        // menuStackView layout
        menuStackView.axis = .horizontal // 축
        menuStackView.alignment = .center
        menuStackView.distribution = .equalSpacing
        menuStackView.spacing = 20
        
        // menuStackView에 버튼 추가
        [btnTV, btnMovie, btnCategory].forEach {
            menuStackView.addArrangedSubview($0)
            $0.setTitleColor(.white, for: .normal)
            $0.layer.shadowColor = UIColor.black.cgColor
            $0.layer.shadowOpacity = 1
            $0.layer.shadowRadius = 3
        }
        
        btnTV.setTitle("TV 프로그램", for: .normal)
        btnMovie.setTitle("영화", for: .normal)
        btnCategory.setTitle("카테고리", for: .normal)
        
        // 버튼에 액션 추가
        btnTV.addTarget(self, action: #selector(btnTVTapped), for: .touchUpInside)
        btnMovie.addTarget(self, action: #selector(btnMovieTapped), for: .touchUpInside)
        btnCategory.addTarget(self, action: #selector(btnCategoryTapped), for: .touchUpInside)
        
        // menuStackView autolayout
        menuStackView.snp.makeConstraints {
            $0.top.equalTo(baseStackView)
            $0.leading.trailing.equalToSuperview().inset(30)
        }
        
        
        
    }
    
    @objc func btnTVTapped(sender: UIButton!) {
        print("TEST :  TV Button Tapped")
    }
    
    @objc func btnMovieTapped(sender: UIButton!) {
        print("TEST :  Movie Button Tapped")
    }
    
    @objc func btnCategoryTapped(sender: UIButton!) {
        print("TEST :  Category Button Tapped")
    }
    
    
    @objc func btnPlusTapped(sender: UIButton!) {
        print("TEST :  Plus Button Tapped")
    }
    
    @objc func btnInfoTapped(sender: UIButton!) {
        print("TEST :  Info Button Tapped")
    }
    
    @objc func btnPlayTapped(sender: UIButton!) {
        print("TEST :  Play Button Tapped")
    }
}
