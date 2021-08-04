//
//  PageViewController.swift
//  SwiftStudy
//
//  Created by hyukjun on 2021/07/15.
//

import UIKit

class PageViewController: UIViewController {
    
    var pageVC = UIPageViewController(transitionStyle: .scroll,
                                      navigationOrientation: .horizontal,
                                      options: nil)
    
    var pageViewControllers: [UIViewController] {
        let page1 = FirstPageVC()
        let page2 = SecondPageVC()
        
        return [page1, page2]
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        self.setPageViewController()
    }
    
    func setNavigation() {
        self.navigationController?.title = "PageViewcontroller"
        self.navigationController?.isNavigationBarHidden = false
        
        let backBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        self.navigationController?.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func setPageViewController() {
        if let firstPage = pageViewControllers.first {
            self.pageVC.setViewControllers([firstPage],
                                           direction: .forward,
                                           animated: true)
        }
        
        self.pageVC.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.pageVC.dataSource = self
        self.pageVC.dataSource = self
        
        self.addChild(pageVC)
        self.view.addSubview(pageVC.view)
        self.pageVC.didMove(toParent: self)
    }
}


extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pageViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        if index > 0 {
            return pageViewControllers[index - 1]
        }
        
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pageViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        
        if index < pageViewControllers.count {
            return pageViewControllers[index + 1]
        }
        
        return nil
    }
    
    
}
