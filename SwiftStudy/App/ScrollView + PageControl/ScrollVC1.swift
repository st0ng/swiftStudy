//
//  PickerViewVC.swift
//  SwiftStudy
//
//  Created by hyukjun on 2021/06/29.
//

import UIKit
import Foundation

public enum Scrollpage {
    case first
    case second
    case third
}

class ScrollVC1: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        self.scrollView.delegate = self
        
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = 3
        
    }
    
    func setNavigation() {
        self.navigationController?.title = "ScrollViews"
        self.navigationController?.isNavigationBarHidden = false
        
        let backBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        self.navigationController?.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    @IBAction func onClickPageControl(_ sender: Any) {
        guard let pageControl = sender as? UIPageControl else {
            return
        }
        
        self.scrollView.setContentOffset(CGPoint(x: Int((self.view.frame.width)) * (pageControl.currentPage), y: 0), animated: true)
    }
}

extension ScrollVC1: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.maxX)
    }
}
