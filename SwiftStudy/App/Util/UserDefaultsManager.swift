//
//  UserDefaultsManager.swift
//  SwiftStudy
//
//  Created by hyukjun on 2021/06/30.
//

import Foundation

class UserDefalultsManager {
    static let shared = UserDefalultsManager()
    
    private let KEY = "SCENEDELEGATE_STATUS_KEY"
    
    private init() {}
    
    func addValue(_ value: String) {
        var newValues = [String]()
        
        if let oldValues = UserDefaults.standard.object(forKey: KEY) as? [String] {
            newValues = oldValues
            newValues.append(value)
        } else {
            newValues.append(value)
        }
        
        UserDefaults.standard.set(newValues, forKey: KEY)
    }
    
    func clear() {
        UserDefaults.standard.removeObject(forKey: KEY)
    }
    
    func reset() -> [String]? {
        return UserDefaults.standard.object(forKey: KEY) as? [String]
    }
    
    
}
