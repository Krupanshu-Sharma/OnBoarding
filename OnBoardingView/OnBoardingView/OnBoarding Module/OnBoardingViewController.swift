//
//  OnBoardingViewController.swift
//  OnBoardingView
//
//  Created by Krupanshu Sharma on 06/12/22.
//

import Foundation
import UIKit

class OnBoardingViewController : UIViewController {
    
    //MARK: - Properties
    private var obViewModel : OnBoardingViewModel!
        
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .lightGray
        return cv
    }()
    
    private let pageControl: UIPageControl = {
        let pc = UIPageControl(frame: .zero)
        return pc
    }()
    
    private let getStartedButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Get Started", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.setHeight(50)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        createDummyData()
    }
    
    func createDummyData() {
        let onBoardItems = [Page(imageName: "onboard1", title: "Lorem Ipsum", description: "Lorem ipsum is placeholder text commonly used in the graphic, print, and publishing industries for previewing layouts and visual mockups."),Page(imageName: "onboard2", title: "What is Lorem Ipsum?", description: "From its medieval origins to the digital era, learn everything there is to know about the ubiquitous lorem ipsum passage."),Page(imageName: "onboard3", title: "Origins and Discovery", description: "Lorem ipsum began as scrambled, nonsensical Latin derived from Cicero's 1st-century BC text De Finibus Bonorum et Malorum.")]
        
        self.obViewModel = OnBoardingViewModel(items: onBoardItems)
        
        pageControl.numberOfPages = self.obViewModel.items.count
    }
    
    func configureUI() {
        // UI Setup
        
        view.backgroundColor = .systemPink
        
        view.addSubview(collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.anchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor,bottom: view.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor)
        collectionView.isPagingEnabled = true
        collectionView.register(OnBoardingCell.self, forCellWithReuseIdentifier: "OnBoardingCell")
        
        view.addSubview(getStartedButton)
        getStartedButton.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 50, paddingBottom: 30, paddingRight: 50)
        getStartedButton.addTarget(self, action: #selector(buttonGetStartedClick), for: .touchUpInside)

        
        view.addSubview(pageControl)
        pageControl.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: getStartedButton.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 50, paddingBottom: 10, paddingRight: 50)
        pageControl.addTarget(self, action: #selector(pageChanged), for: .valueChanged)

    }
    //MARK: - Helpers
    @objc func buttonGetStartedClick() {
        if let myDelegate = UIApplication.shared.delegate as? AppDelegate {
           myDelegate.changeRootViewController()
        }
    }
    
    @objc func pageChanged(_ sender: Any) {
        let pc = sender as! UIPageControl
        
        // scrolling the collectionView to the selected page
        collectionView.scrollToItem(at: IndexPath(item: pc.currentPage, section: 0),
                                    at: .centeredHorizontally, animated: true)
    }
}

//MARK: - Datasource and Delegate

extension OnBoardingViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnBoardingCell", for: indexPath) as! OnBoardingCell
        let pageData = self.obViewModel.pageAtIndex(indexPath.row)
        cell.pageImageView.image = UIImage(imageLiteralResourceName: pageData.imageName)
        cell.pageTitle.text = pageData.title
        cell.pageDescription.text = pageData.description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.obViewModel.numberOfItemsInSection(section)
    }
}

extension OnBoardingViewController: UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
}
