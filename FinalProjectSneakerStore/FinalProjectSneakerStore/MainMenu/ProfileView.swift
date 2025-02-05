//
//  ProfileView.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 04.02.2025.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            Color.gray.opacity(0.1)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 20) {
                    Text("Cart")
                        .font(.headline)
                        .padding(.top, 10)
                        .padding(.bottom,20)
                    
                    CustomButton(title: "Account Information", image: "chevron.right") {
                        print("Hello, World!")
                    }
                    CustomButton(title: "Order History", image: "chevron.right") {
                        print("Hello, World!")
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .frame(width: 400, height: 52)
                        HStack {
                            Text("Shoe size")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .font(.system(size: 17))
                                .multilineTextAlignment(.leading)
                                .padding(.trailing, 8)
                                .padding(.leading, 15)
                            Button {
                                print("hello")
                            } label: {
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 15)
                            }
                            
                        }
                    }
                    CustomButton(title: "How to know your shoe size?", image: "arrow.up.right.square") {
                        print("Hello, World!")
                    }
                    CustomButton(title: "How to check authenticity of the shoe?", image: "arrow.up.right.square") {
                        print("Hello, World!")
                    }
                }
                
            }
            Button(action: {
                
            }) {
                Text("Sign Out")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 358, height: 54)
                    .background(Color.black)
                    .cornerRadius(20)
            }
            .offset(x: 2, y: 260)
        }
    }
}

#Preview {
    ProfileView()
}
