//
//  SecondOnboarding.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 01.02.2025.
//
import SwiftUI

struct SecondOnboarding: View {
    @Namespace var animationNamespace
    @Binding var onboardingIndex: Int
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            Image("2.1")
                .resizable()
                .frame(width: 361, height: 484)
                .offset(x: -90, y: -190)
                .shadow(color: .black.opacity(0.5), radius: 20)

            Image("2.2")
                .resizable()
                .frame(width: 265, height: 345)
                .offset(x: 95, y: -290)
                .shadow(color: .black.opacity(0.4), radius: 20)
            
            
            Path { path in
                path.move(to: CGPoint(x: 130, y: 260))
                
                path.addCurve(
                    to: CGPoint(x: 270, y: 240),
                    control1: CGPoint(x: 180, y: 140),
                    control2: CGPoint(x: 255, y: 190)
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
                path.move(to: CGPoint(x: 120, y: 260))
                
                path.addCurve(
                    to: CGPoint(x: 280, y: 240),
                    control1: CGPoint(x: 180, y: 130),
                    control2: CGPoint(x: 255, y: 180)
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
            .blur(radius: 7)
            .frame(height: 200)
            // NEXT LINE
            
            Path { path in
                path.move(to: CGPoint(x: 400, y: 270))
                path.addCurve(
                    to: CGPoint(x: 410, y: 130),
                    control1: CGPoint(x: 330, y: 200),
                    control2: CGPoint(x: 350, y: 150)
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
                path.move(to: CGPoint(x: 390, y: 260))
                path.addCurve(
                    to: CGPoint(x: 410, y: 125),
                    control1: CGPoint(x: 320, y: 200),
                    control2: CGPoint(x: 340, y: 150)
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
            .blur(radius: 7)
            .frame(height: 200)
        
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [
                                        Color(red: 0.84, green: 0.64, blue: 0.80),
                                        Color(red: 0.77, green: 0.76, blue: 0.78)
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
                                                Color(red: 0.84, green: 0.64, blue: 0.80),
                                                Color(red: 0.77, green: 0.76, blue: 0.78)
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
                                        .foregroundColor(onboardingIndex == 1 ? .white : .white.opacity(0.5))
                                    Circle()
                                        .frame(width: 8, height: 8)
                                        .foregroundColor(.white.opacity(0.5))
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
                                    withAnimation {
                                        onboardingIndex = 2
                                    }
                                } label: {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 30)
                                            .fill(Color.black)
                                            .frame(width: 358, height: 54)
                                        Text("Next")
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



