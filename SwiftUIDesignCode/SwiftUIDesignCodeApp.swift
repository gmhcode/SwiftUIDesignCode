//
//  SwiftUIDesignCodeApp.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 12/23/20.
//

import SwiftUI
import Firebase
@main
struct SwiftUIDesignCodeApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            
            CourseList().environmentObject(UserStore())
//            TopBar().environmentObject(UserStore())
//            Home().environmentObject(UserStore())
//            LoginView().environmentObject(UserStore())
//            ContentView().environmentObject(UserStore())
        }
    }
}
