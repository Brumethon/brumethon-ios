//
//  User.swift
//  Brumethon
//
//  Created by Gwendal on 10/03/2022.
//

import Foundation

class User: ObservableObject {
    static var shared: User = User()
    
    var token: String? {
        didSet {
            if token != nil {
                isAuthenticated = true
                UserDefaults.standard.setValue(token, forKey: "token")
            } else {
                isAuthenticated = false
                UserDefaults.standard.removeObject(forKey: "token")
            }
        }
    }
    var infos: UserInfos?
    
    @Published var isAuthenticated: Bool = false
}
