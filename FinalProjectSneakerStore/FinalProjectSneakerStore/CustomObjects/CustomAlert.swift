//
//  CustomAlert.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 04.02.2025.
//


import SwiftUI

struct CustomAlert: View {
    var title: String
    var titleButtonCancel: String
    var titleButtonConfirm: String
    var actionCancel: () -> Void
    var actionConfirm: () -> Void
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: 270, height: 135)
            .foregroundColor(Color.gray.opacity(0.1))
            .shadow(radius: 10)
            .overlay(
                VStack(spacing: 15) {
                    Text("Hello, World!")
                        .font(.system(size: 17))
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    
                    Path { path in
                        path.move(to: CGPoint(x: -15, y: 30))
                        path.addLine(to: CGPoint(x: 255, y: 30))
                    }
                    .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                    
                    
                    HStack {
                        Button(action: actionCancel) {
                            Text(titleButtonCancel)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .offset(x: -16, y: 0)
                                .foregroundColor(.black)
                        }
                        Path { path in
                            path.move(to: CGPoint(x: 35, y: -13))
                            path.addLine(to: CGPoint(x: 35, y: 44))
                        }
                        .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        
                        Button(action: actionConfirm) {
                            Text(titleButtonConfirm)
                                .fontWeight(.semibold)
                                .frame(maxWidth: .infinity)
                                .offset(x: -16, y: 0)
                                .foregroundColor(.black)
                        }
                    }
                }
                .padding()
            )
    }
}


