//
//  ViewController.swift
//  OnBoardingIOS
//
//  Created by Moises on 7/21/17.
//  Copyright © 2017 Moises. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    static let yellowColor: UIColor = UIColor(red: 247/255, green: 154/255, blue: 27/255, alpha: 1)
    
    let cellId = "cellId"
    let loginCellId = "loginCellId"
    var pages: [Page] {
        let firstPage = Page(title: "Buu", message: "He is my favorite villano character", imageName: "page1")
        let secondPage = Page(title: "Trunks", message: "He is a young powerful from future", imageName: "page2")
        let thirdPage = Page(title: "Goku", message: "He is the best than all", imageName: "page3")
        return [firstPage, secondPage, thirdPage]
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.isPagingEnabled = true
        return cv
    }()
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.pageIndicatorTintColor = .lightGray
        pc.currentPageIndicatorTintColor = yellowColor
        pc.numberOfPages = self.pages.count + 1
        return pc
    }()
    
    //WAY 1 CREATE BUTTON
    let skipButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Skip", for: .normal)
        button.setTitleColor(yellowColor, for: .normal)
        return button
    }()
    
    //WAY 2 CREATE BUTTON
    var nextButton: UIButton = {
        return ViewController.self.generateButton(title: "Next")
    }()
    
    static func generateButton(title: String) -> UIButton{
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(yellowColor, for: .normal)
        return button
    }
    
    var pageControlAnchor: NSLayoutConstraint?
    var skipButtonAnchor: NSLayoutConstraint?
    var nextButtonAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        alignViews()
    }
    
    func addViews(){
        view.addSubview(collectionView)
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
    }
    
    func alignViews(){
        skipButtonAnchor = skipButton.anchor(view.topAnchor, left: view.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50).first
        
        nextButtonAnchor = nextButton.anchor(view.topAnchor, left: nil, bottom: nil, right: view.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 60, heightConstant: 50).first
        
        //collectionView.frame = view.frame
        
        pageControlAnchor = pageControl.anchor(nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor,
                               topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0,
                               widthConstant: 0, heightConstant: 40)[1]
        
        //Use autolayout instead
        collectionView.anchorToTop(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        registerCells()
    }
    
    //ANIMATE PAGE CONTROL
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let pageNumber = Int(targetContentOffset.pointee.x / view.frame.width)
        pageControl.currentPage = pageNumber
        
        if pageNumber == pages.count {
            pageControlAnchor?.constant = 40
            skipButtonAnchor?.constant = -40
            nextButtonAnchor?.constant = -40
        }else{
            pageControlAnchor?.constant = 0
            skipButtonAnchor?.constant = 16
            nextButtonAnchor?.constant = 16
        }
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations:{
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pages.count + 1
    }
    
    fileprivate func registerCells(){
        collectionView.register(PageCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: loginCellId)
    }
    
    
    //IMPLEMENTATION FUNCTIONS OF COLLECTION VIEW
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item == pages.count {
            let loginCell = collectionView.dequeueReusableCell(withReuseIdentifier: loginCellId, for: indexPath)
            return loginCell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! PageCell
        let page = pages[indexPath.item]
        cell.page = page
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
}

