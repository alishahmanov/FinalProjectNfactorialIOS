//
//  FirstOnboarding.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 01.02.2025.
//
import SwiftUI

struct FirstOnboarding: View {
    @Binding var onboardingIndex: Int
    @Namespace var animationNamespace
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            Image("1.1")
                .resizable()
                .frame(width: 397, height: 532)
                .offset(x: -60, y: -190)
                .shadow(color: .black.opacity(0.3), radius: 20)

            Image("1.2")
                .resizable()
                .frame(width: 271, height: 363)
                .offset(x: 100, y: -290)
                .shadow(color: .black.opacity(0.3), radius: 20)

            Path { path in
                path.move(to: CGPoint(x: 0, y: 190))
                
                path.addCurve(
                    to: CGPoint(x: 140, y: 260),
                    control1: CGPoint(x: 60, y: 80),
                    control2: CGPoint(x: 170, y: 150)
                )
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 3/255, green: 147/255, blue: 255/255),
                        Color(red: 218/255, green: 223/255, blue: 120/255)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round)
            )
            .frame(height: 200)
            .shadow(color: .black.opacity(0.4), radius: 20)
            
            Path { path in
                path.move(to: CGPoint(x: 0, y: 200))
                
                path.addCurve(
                    to: CGPoint(x: 145, y: 260),
                    control1: CGPoint(x: 60, y: 80),
                    control2: CGPoint(x: 170, y: 150)
                )
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                                    Color(red: 0.8, green: 0.9, blue: 0.6),
                                    Color(red: 1.0, green: 1.0, blue: 0.6)
                                ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round)
            )
            .blur(radius: 7)
            .frame(height: 200)
            .shadow(color: .black.opacity(0.4), radius: 20)
            
            // NEXT LINE
            
            Path { path in
                path.move(to: CGPoint(x: 240, y: 350))
                
                path.addCurve(
                    to: CGPoint(x: 350, y: 240),
                    control1: CGPoint(x: 190, y: 160),
                    control2: CGPoint(x: 340, y: 160)
                )
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                                    Color(red: 0.6, green: 0.8, blue: 1.0),
                                    Color(red: 0.5, green: 0.7, blue: 0.9)
                                ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                style: StrokeStyle(lineWidth: 30, lineCap: .round, lineJoin: .round)
            )
            .frame(height: 200)
            .shadow(color: .black.opacity(0.4), radius: 20)
            
            Path { path in
                path.move(to: CGPoint(x: 245, y: 350))
                
                path.addCurve(
                    to: CGPoint(x: 340, y: 240),
                    control1: CGPoint(x: 190, y: 170),
                    control2: CGPoint(x: 340, y: 170)
                )
            }
            .stroke(
                LinearGradient(
                    gradient: Gradient(colors: [
                        Color(red: 3/255, green: 147/255, blue: 255/255),
                        Color(red: 218/255, green: 223/255, blue: 120/255)
                    ]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                ),
                style: StrokeStyle(lineWidth: 18, lineCap: .round, lineJoin: .round)
            )
            .blur(radius: 4)
            .frame(height: 200)
            
            
            
            
            RoundedRectangle(cornerRadius: 30)
                .fill(
                    LinearGradient(
                        gradient: Gradient(colors: [Color(red: 0.56, green: 0.67, blue: 0.75),
                                                    Color(red: 0.82, green: 0.79, blue: 0.74)
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
                                gradient: Gradient(colors: [Color(red: 0.56, green: 0.67, blue: 0.75),
                                                            Color(red: 0.82, green: 0.79, blue: 0.74)
                                                           ]),
                                startPoint: .top,
                                endPoint: .bottom
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
                                        .foregroundColor(onboardingIndex == 0 ? .white : .white.opacity(0.5))
                                    Circle()
                                        .frame(width: 8, height: 8)
                                        .foregroundColor(.white.opacity(0.5))
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
                                        onboardingIndex = 1
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


