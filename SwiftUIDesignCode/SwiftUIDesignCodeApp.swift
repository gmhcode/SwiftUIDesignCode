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
            
//            CourseList()
//            TopBar()
            LoginView()
//            ContentView()
        }
    }
}
