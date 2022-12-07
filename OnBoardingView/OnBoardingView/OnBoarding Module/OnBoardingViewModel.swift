//
//  OnBoardingViewModel.swift
//  OnBoardingView
//
//  Created by Krupanshu Sharma on 06/12/22.
//

import Foundation

struct OnBoardingViewModel {
    var items: [Page]
}

extension OnBoardingViewModel {
    
    var numbersOfSections: Int {
        return 1
    }
    
    func numberOfItemsInSection(_ section: Int) -> Int {
        return self.items.count
    }
    
    func pageAtIndex(_ index: Int) -> OnBoardingCellViewModel {
        let page = self.items[index]
        return OnBoardingCellViewModel(page)
    }
}
