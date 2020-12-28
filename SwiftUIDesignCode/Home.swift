//
//  Home.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 12/28/20.
//

import SwiftUI

struct Home: View {
    @State var showProfile = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1))
                .edgesIgnoringSafeArea(.all)
            VStack {
                HStack {
                    Text("Watching")
                        .font(.system(size: 28, weight: .bold))
                    
                    Spacer()
                    
                    Button(action: {self.showProfile.toggle()}) {
                        Image("Avatar")
                            .resizable()
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal)
                
                .padding(.top,30)
                
                Spacer()
            }
            .padding(.top, 44)
            
            .background(Color.white)
            
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            
            .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
            
            .offset(y: showProfile ? -450 : 0)
            
            .rotation3DEffect(Angle(degrees: showProfile ? Double(viewState.height / 10) - 10 : 0), axis: (x: 10.0, y: 0, z: 0))
            
            //shrinks the Home View when showProfile = true
            .scaleEffect(showProfile ? 0.9 : 1)
            
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            
            .edgesIgnoringSafeArea(.all)
            
            MenuView()
                .background(Color.black.opacity(0.001))
                .offset(y: showProfile ? 0 : 600)
                .offset(y: viewState.height)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .onTapGesture {
                    self.showProfile.toggle()
            }
                //changes the value of viewState
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                }
                .onEnded { value in
                    //allows us to drag to dismiss
                    if self.viewState.height > 50 {
                        self.showProfile = false
                    }
                    self.viewState = .zero
                }
            )
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
