//
//  TimerViewController.swift
//  SwiftStudy
//
//  Created by hyukjun on 2021/08/01.
//

import UIKit

class TimerViewController: UIViewController {
    @IBOutlet weak var timeLB: UILabel!
    
    weak var timer: Timer?
    var totalSec: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        self.setTimer()
    }
    
    func setNavigation() {
        self.navigationController?.title = "Timer"
        self.navigationController?.isNavigationBarHidden = false
        
        let backBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        self.navigationController?.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    deinit {
        self.stopTimer()
    }
    
    func setTimer() {
        self.timer?.invalidate()
        self.totalSec = 0
        
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] (timer) in
            self?.timerHandler(timer)
        }
    }
    
    func stopTimer() {
        self.timer?.invalidate()
    }
    
    func timerHandler(_ timer: Timer) {
        self.totalSec += 1
        self.timeLB.text = String(totalSec)
        print(totalSec)
    }
    
}
