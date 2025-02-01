//
//  ThirdOnboarding.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 01.02.2025.
//
import SwiftUI

struct ThirdOnboarding: View {
    @Binding var onboardingIndex: Int
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            Image("3.2")
                .resizable()
                .frame(width: 381, height: 504)
                .offset(x: -62, y: -190)
                .shadow(color: .black.opacity(0.3), radius: 20)
            
            Image("3.1")
                .resizable()
                .frame(width: 301, height: 380)
                .offset(x: 110, y: -300)
                .shadow(color: .black.opacity(0.3), radius: 20)
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: 260))
                
                path.addCurve(
                    to: CGPoint(x: 150, y: 240),
                    control1: CGPoint(x: 60, y: 160),
                    control2: CGPoint(x: 110, y: 210)
                )
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                                    Color(red: 0.75, green: 0.45, blue: 0.35),
                                    Color(red: 0.85, green: 0.65, blue: 0.55)
                                ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round)
            )
            .frame(height: 200)
            .shadow(color: .black.opacity(0.4), radius: 20)
            
            Path { path in
                path.move(to: CGPoint(x: -10, y: 260))
                
                path.addCurve(
                    to: CGPoint(x: 160, y: 240),
                    control1: CGPoint(x: 60, y: 150),
                    control2: CGPoint(x: 110, y: 200)
                )
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                                    Color(red: 1.0, green: 0.8, blue: 0.8),
                                    Color(red: 0.95, green: 0.65, blue: 0.6)
                                ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round)
            )
            .blur(radius: 7)
            .frame(height: 200)
            
            
            // NEXT LINE
            
            Path { path in
                path.move(to: CGPoint(x: 250, y: 240))
                
                path.addCurve(
                    to: CGPoint(x: 370, y: 240),
                    control1: CGPoint(x: 270, y: 170),
                    control2: CGPoint(x: 350, y: 170)
                )
                
                
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                                    Color(red: 0.75, green: 0.45, blue: 0.35),
                                    Color(red: 0.85, green: 0.65, blue: 0.55)
                                ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round)
            )
            .frame(height: 200)
            .shadow(color: .black.opacity(0.4), radius: 20)
            
            Path { path in
                path.move(to: CGPoint(x: 245, y: 230))
                
                path.addCurve(
                    to: CGPoint(x: 380, y: 240),
                    control1: CGPoint(x: 270, y: 160),
                    control2: CGPoint(x: 350, y: 160)
                )
                
                
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                                    Color(red: 1.0, green: 0.8, blue: 0.8),
                                    Color(red: 0.95, green: 0.65, blue: 0.6)
                                ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round)
            )
            .blur(radius: 4)
            .frame(height: 200)
            
            
            
            
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                            Color(red: 0.85, green: 0.80, blue: 0.75),
                            Color(red: 0.60, green: 0.55, blue: 0.50)
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )
                .frame(width: 410, height: 288 )
                .offset(x: 0, y: 280)
                .overlay(
                    RoundedRectangle(cornerRadius: 30)
                        .fill(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(red: 0.85, green: 0.80, blue: 0.75),
                                    Color(red: 0.60, green: 0.55, blue: 0.50)
                                ]),
                                startPoint: .trailing,
                                endPoint: .leading
                            )
                        )
                        .blur(radius: 10)
                        .frame(width: 410, height: 288 )
                        .offset(x: 0, y: 290)
                        .overlay(
                            VStack {
                                HStack(spacing: 24) {
                                    Circle()
                                        .frame(width: 8, height: 8)
                                        .foregroundColor( .white.opacity(0.5))
                                    Circle()
                                        .frame(width: 8, height: 8)
                                        .foregroundColor( .white.opacity(0.5))
                                    Circle()
                                        .frame(width: 8, height: 8)
                                        .foregroundColor(onboardingIndex == 2 ? .white : .white.opacity(0.5))
                                }
                                .padding(.top, 32)
                                .padding(.bottom, 40)
                                Text("Fast shopping")
                                    .foregroundColor(.white)
                                    .font(.system(size: 28, weight: .semibold, design: .default))
                                    .padding(.bottom,16)
                                Text("Get all of yours desired sneakers n one place.")
                                    .foregroundColor(.white)
                                    .font(.system(size: 17, weight: .semibold, design: .default))
                                    .padding(.bottom,24)
                                Button {
                                    onboardingIndex = 0
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(Color.black)
                                            .frame(width: 358, height: 54)
                                        Text("Finish")
                                            .foregroundColor(.white)
                                            .font(.system(size: 17, weight: .semibold, design: .default))
                                    }
                                }
                                .padding(.bottom, 58)
                            }
                                .frame(width: 410, height: 288 )
                                .offset(x: 0, y: 280)
                        )
                )
        }
    }
}
