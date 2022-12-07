//
//  OnBoardingCellViewModel.swift
//  OnBoardingView
//
//  Created by Krupanshu Sharma on 06/12/22.
//

import Foundation

struct Page {
    let imageName: String
    let title: String
    let description: String
}


struct OnBoardingCellViewModel{
    private let page: Page
}

extension OnBoardingCellViewModel {
    init(_ page: Page) {
        self.page = page
    }
}

extension OnBoardingCellViewModel {
    var title: String {
        return self.page.title
    }
    
    var description: String {
        return self.page.description
    }
    
    var imageName: String {
        return self.page.imageName
    }
}


