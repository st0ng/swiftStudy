//
//  MainViewController.swift
//  SwiftStudy
//
//  Created by hyukjun on 2021/06/15.
//

import UIKit

class TextFieldVC: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonBottomConstraints: NSLayoutConstraint!
    @IBOutlet weak var button: UIButton!
    
    var height: CGFloat?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigation()
        self.settingStyle()
        self.settingKeyboard()
        
        self.textField.delegate = self
    }
    
    func setNavigation() {
        self.navigationController?.title = "TextField"
        self.navigationController?.isNavigationBarHidden = false
        
        let backBarButtonItem = UIBarButtonItem(title: "back", style: .plain, target: self, action: nil)
        self.navigationController?.navigationItem.backBarButtonItem = backBarButtonItem
    }
    
    func settingStyle() {
        self.view.backgroundColor = .black
        
        self.textField.placeholder = "숫자만 입력하세요."
        self.textField.setLeftPaddingPoints(5)
    }
    
    func settingKeyboard() {
        let tap = UIGestureRecognizer.init(target: self, action: #selector(self.dismissKeyboard))
        self.view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardShow),
                                               name: UIResponder.keyboardDidShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardHide),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }
    
    @objc func dismissKeyboard() {
        self.view.endEditing(true)
        
    }
    
    @objc func keyboardShow(notification: NSNotification) {
        let notiInfo = notification.userInfo! as NSDictionary
        
        //키보드 높이 가져오기 위해
        let keyboardFrame = notiInfo.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as! NSValue
        self.height = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        // 애니메이션 효과를 키보드 애니메이션 시간과 동일하게
        UIView.animate(withDuration: animationDuration) {
            self.view.frame.origin.y -= 100
            self.buttonBottomConstraints.constant = (self.height ?? 0) - 100
            self.view.layoutIfNeeded()
        }
    }
    
    
    @objc func keyboardHide(notification: NSNotification) {
        let notiInfo = notification.userInfo! as NSDictionary
        
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
    
        // 애니메이션 효과를 키보드 애니메이션 시간과 동일하게
        UIView.animate(withDuration: animationDuration) {
            self.view.frame.origin.y = 0
            self.buttonBottomConstraints.constant = 0
            self.view.layoutIfNeeded()
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // self.inputField.resignFirstResponder()
        // -> inputField 컨트롤에서 사용시 키패드 닫힘
        // self.inputField.endEditing(true)
        // -> inputField 컨트롤에서 사용시 키패드 닫힘
        self.textField.resignFirstResponder()
    }
    
    @IBAction func onClickButton(_ sender: Any) {
        self.textField.endEditing(true)
    }
    
}


extension TextFieldVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        /*
         현재 커서 위치 : range.location
         지워질 양 : range.length
         추가될 값 : string
         */
        
        guard let textFieldCount = textField.text?.count else { return false }
        let textCount = textFieldCount + string.count - range.length
        return !(textCount > 4)
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ value:CGFloat){
        //왼쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setRightPaddingPoints(_ value:CGFloat) {
        //오른쪽에 여백 주기
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: value, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
