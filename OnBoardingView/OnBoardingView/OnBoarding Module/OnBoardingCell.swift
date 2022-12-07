//
//  OnBoardingCell.swift
//  OnBoardingView
//
//  Created by Krupanshu Sharma on 06/12/22.
//

import Foundation
import UIKit


class OnBoardingCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    let pageImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.isUserInteractionEnabled = true
        iv.clipsToBounds = true
        iv.backgroundColor = .systemFill
        iv.image = UIImage(imageLiteralResourceName: "onboard1")
        return iv
    }()
    
    let pageTitle: UILabel = {
        let ul = UILabel()
        ul.textColor = .white
        ul.font = .boldSystemFont(ofSize: 24)
        ul.textAlignment = .center
        ul.setHeight(58)
        ul.numberOfLines = 2
        ul.adjustsFontSizeToFitWidth = true
        return ul
    }()
    
    let pageDescription: UILabel = {
        let ul = UILabel()
        ul.textColor = .white
        ul.font = .systemFont(ofSize: 20)
        ul.textAlignment = .center
        ul.setHeight(80)
        ul.numberOfLines = 3
        ul.setWidth(180)
        ul.adjustsFontSizeToFitWidth = true
        return ul
    }()
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .systemBackground
        
        addSubview(pageImageView)
        pageImageView.anchor(top:topAnchor,left: safeAreaLayoutGuide.leftAnchor, bottom: bottomAnchor, right: safeAreaLayoutGuide.rightAnchor)
        
        let stack = UIStackView(arrangedSubviews: [pageTitle, pageDescription])
        stack.spacing = 20
        stack.axis = .vertical
        addSubview(stack)
        stack.anchor(left: safeAreaLayoutGuide.leftAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, right: safeAreaLayoutGuide.rightAnchor,paddingLeft: 80, paddingBottom: 150, paddingRight: 80)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
