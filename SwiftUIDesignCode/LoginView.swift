//
//  LoginView.swift
//  SwiftUIDesignCode
//
//  Created by Greg Hughes on 1/11/21.
//

import SwiftUI

struct LoginView: View {
    
    @State var show = false
    @State var viewState = CGSize.zero
    @State var isDragging = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.edgesIgnoringSafeArea(.all)
            Color("background2")
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .edgesIgnoringSafeArea(.bottom)
            VStack {
                GeometryReader { geometry in
                    
                    VStack {
                        Spacer()
                        Text("Learn design & code. \nFrom scratch.")
                            .font(.system(size: geometry.size.width / 10, weight: .bold))
                            .foregroundColor(.white)
                        Spacer()
                    }
                    
                }
                .frame(maxWidth: 375, maxHeight: 120)
                .padding(.horizontal,16)
                //allows the text to move around with the background
                .offset(x: viewState.width/15, y: viewState.height/15)
                
                Text("80 hours of courses for SwiftUI, React and design tools")
                    .font(.subheadline)
                    .frame(width: 250)
                    //allows the text to move around with the background
                    .offset(x: viewState.width/20, y: viewState.height/20)
                Spacer()
                    
            }
            .multilineTextAlignment(.center)
            .padding(.top,100)
            .frame(height: 477)
            .frame(maxWidth: .infinity)
            .background(
                ZStack {
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x:-150,y:-200)
                        .rotationEffect(Angle(degrees: show ? 360+90 : 90))
                        .blendMode(.plusDarker)
                        .animation(Animation.linear(duration: 120).repeatForever(autoreverses: false))
                        .onAppear{
                            self.show = true
                        }
                    Image(uiImage: #imageLiteral(resourceName: "Blob"))
                        .offset(x:-200,y:-250)
                        .rotationEffect(Angle(degrees: show ? 360 : 0), anchor: .leading)
                        .blendMode(.overlay)
                        .animation(Animation.linear(duration: 100).repeatForever(autoreverses: false))
                }
            )
            .background(
                Image(uiImage: #imageLiteral(resourceName: "Card3"))
                    //allows the image to move with the background
                    .offset(x: viewState.width/25, y: viewState.height/25),
                alignment: .bottom
            )
            .background(Color(#colorLiteral(red: 0.4117647059, green: 0.4705882353, blue: 0.9725490196, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            //makes the 3d effect smooth
            .scaleEffect(isDragging ? 0.9 : 1)
            .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
            //3d effect
            .rotation3DEffect(
                Angle(degrees: 5),
                axis: (x: viewState.width, y: viewState.height, z: 0.0)
                )
            .gesture(
                DragGesture().onChanged { value in
                    self.viewState = value.translation
                    self.isDragging = true
                }
                .onEnded{ value in
                    self.viewState = .zero
                    self.isDragging = false
                    
                }
            )
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
//            .previewDevice("iPad Air 2")
    }
}
