//
//  UserStore.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 1/20/21.
//

import SwiftUI
import Combine

class UserStore: ObservableObject {
    @Published var isLogged: Bool = UserDefaults.standard.bool(forKey: "isLogged") {
        didSet {
            UserDefaults.standard.setValue(self.isLogged, forKey: "isLogged")
        }
    }
    @Published var showLogin = false
    
}
