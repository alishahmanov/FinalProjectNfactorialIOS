//
//  WecomePageView.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 01.02.2025.
//

import SwiftUI

class NavigationStates: ObservableObject {
    @Published var goToSignIn: Bool = false
    @Published var goToSignUp: Bool = false
}

struct WecomePageView: View {
    @StateObject private var navigationStates = NavigationStates()
    var body: some View {
        NavigationView {
            ZStack {
                Path { path in
                    path.move(to: CGPoint(x: 0, y: 0))
                    
                    path.addCurve(
                        to: CGPoint(x: 160, y: -200),
                        control1: CGPoint(x: 60, y: 0),
                        control2: CGPoint(x: 150, y: 0)
                    )
                    
                    path.addCurve(
                        to: CGPoint(x: 0, y: -350),
                        control1: CGPoint(x: 150, y: -360),
                        control2: CGPoint(x: 2, y: -340)
                    )
                }
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 213/255, green: 43/255, blue: 145/255),
                            Color(red: 123/255, green: 97/255, blue: 255/255)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round)
                )
                .frame(height: 200)
                .shadow(color: .black.opacity(0.4), radius: 20)
                Path { path in
                    path.move(to: CGPoint(x: 0, y: -8))
                    
                    path.addCurve(
                        to: CGPoint(x: 152, y: -200),
                        control1: CGPoint(x: 60, y: 0),
                        control2: CGPoint(x: 150, y: 0)
                    )
                    
                    path.addCurve(
                        to: CGPoint(x: -8, y: -330),
                        control1: CGPoint(x: 150, y: -360),
                        control2: CGPoint(x: 2, y: -340)
                    )
                }
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 1.0, green: 0.8, blue: 0.6),
                            Color(red: 1.0, green: 0.7, blue: 0.7)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round)
                )
                .frame(height: 200)
                .blur(radius: 7)
                
                // NEXT LINE
                
                Path { path in
                    path.move(to: CGPoint(x: 0, y: -120))
                    
                    path.addCurve(
                        to: CGPoint(x: 400, y: -200),
                        control1: CGPoint(x: 200, y: -50),
                        control2: CGPoint(x: 250, y: -60)
                    )
                }
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 213/255, green: 43/255, blue: 145/255),
                            Color(red: 123/255, green: 97/255, blue: 255/255)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round)
                )
                .frame(height: 200)
                .shadow(color: .black.opacity(0.4), radius: 20)
                Path { path in
                    path.move(to: CGPoint(x: 0, y: -127))
                    
                    path.addCurve(
                        to: CGPoint(x: 400, y: -207),
                        control1: CGPoint(x: 200, y: -57),
                        control2: CGPoint(x: 250, y: -67)
                    )
                }
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 1.0, green: 0.8, blue: 0.6),
                            Color(red: 1.0, green: 0.7, blue: 0.7)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round)
                )
                .blur(radius: 5)
                .frame(height: 200)
                
                // NEXT LINE
                Path { path in
                    path.move(to: CGPoint(x: 400, y: 90))
                    
                    path.addCurve(
                        to: CGPoint(x: 190, y: -100),
                        control1: CGPoint(x: 260, y: 80),
                        control2: CGPoint(x: 230, y: 70)
                    )
                }
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 213/255, green: 43/255, blue: 145/255),
                            Color(red: 123/255, green: 97/255, blue: 255/255)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round)
                )
                Path { path in
                    path.move(to: CGPoint(x: 400, y: 85))
                    
                    path.addCurve(
                        to: CGPoint(x: 190, y: -110),
                        control1: CGPoint(x: 260, y: 80),
                        control2: CGPoint(x: 230, y: 60)
                    )
                }
                .stroke(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 1.0, green: 0.8, blue: 0.6),
                            Color(red: 1.0, green: 0.7, blue: 0.7)
                        ]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round)
                )
                .blur(radius: 5)
                
                
                Image("4.1")
                    .resizable()
                    .frame(width: 278, height: 343)
                    .offset(x: -100, y: -30)
                    .shadow(color: .black.opacity(0.3), radius: 20)
                
                Image("4.2")
                    .resizable()
                    .frame(width: 278, height: 343)
                    .offset(x: 130, y: -120)
                    .shadow(color: .black.opacity(0.3), radius: 20)
                Rectangle()
                    .background(
                        Color.clear
                            .offset(x: 0, y: 280)
                        
                    )
                    .frame(width: 410, height: 288 )
                    .offset(x: 0, y: 280)
                    .overlay(
                        VStack {
                            Text("Welcome to the biggest sneaker store app")
                                .frame(width: 358, height: 68)
                                .font(.system(size: 28, weight: .semibold, design: .default))
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 24)
                            Button {
                                navigationStates.goToSignUp = true
                            } label: {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(Color.black)
                                        .frame(width: 358, height: 54)
                                    Text("Sign Up")
                                        .foregroundColor(.white)
                                        .font(.system(size: 17, weight: .semibold, design: .default))
                                }
                            }
                            .padding(.bottom, 8)
                            Text("I already have an account")
                                .foregroundColor(.black)
                                .font(.system(size: 17, weight: .semibold, design: .default))
                                .padding(.bottom, 58)
                                .onTapGesture {
                                    navigationStates.goToSignIn = true
                                }
                        }
                    )
                    .offset(x: 0, y: 280)
                
                NavigationLink(destination: SignInEmailView(), isActive: $navigationStates.goToSignIn) {
                    EmptyView()
                }
                
                NavigationLink(destination: SignUpEmailView(), isActive: $navigationStates.goToSignUp) {
                    EmptyView()
                }
            }
        }
    }
}

#Preview {
    WecomePageView()
}
