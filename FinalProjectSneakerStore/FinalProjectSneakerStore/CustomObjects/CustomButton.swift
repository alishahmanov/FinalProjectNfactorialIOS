//
//  CustomButton.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 04.02.2025.
//


import SwiftUI

struct CustomButton: View {
    let title: String
    let image: String
    let action: () -> Void
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 400, height: 52)
            HStack {
                Text(title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 17))
                    .multilineTextAlignment(.leading)
                    .padding(.trailing, 8)
                    .padding(.leading, 15)
                Button(action: action) {
                    Image(systemName: image)
                        .foregroundColor(.gray)
                        .padding(.trailing, 15)
                }
                
            }
        }
    }
}

