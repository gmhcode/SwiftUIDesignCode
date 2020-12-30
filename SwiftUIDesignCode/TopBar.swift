//
//  TopBar.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 12/29/20.
//

import SwiftUI

struct TopBar: View {
    var body: some View {
        TabView {
            Home().tabItem {
                Image(systemName: "play.circle.fill")
                Text("Home")
            }
            ContentView().tabItem {
                Image(systemName: "rectangle.stack.fill")
                Text("Certificates")
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}

struct TopBar_Previews: PreviewProvider {
    static var previews: some View {
        TopBar().previewDevice("iPhone 8")
        TopBar().previewDevice("iPhone 11 Pro Max")
    }
}
