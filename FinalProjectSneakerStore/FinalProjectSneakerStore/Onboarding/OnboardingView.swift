//
//  OnboardingView.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 31.01.2025.
//

import SwiftUI

struct OnboardingView: View {
    @State var onboardingIndex: Int = 0
    @Namespace private var animationNamespace
    var body: some View {
        ZStack {
            if onboardingIndex == 0 {
                FirstOnboarding(onboardingIndex: $onboardingIndex)
                    .matchedGeometryEffect(id: "onboarding", in: animationNamespace)
                    .transition(.scale(scale: 1.1).combined(with: .opacity))
            } else if onboardingIndex == 1 {
                SecondOnboarding(onboardingIndex: $onboardingIndex)
                    .matchedGeometryEffect(id: "onboarding", in: animationNamespace)
                    .transition(.scale(scale: 1.1).combined(with: .opacity))
            } else {
                ThirdOnboarding(onboardingIndex: $onboardingIndex)
                    .matchedGeometryEffect(id: "onboarding", in: animationNamespace)
                    .transition(.scale(scale: 1.1).combined(with: .opacity))
            }
        }
        .animation(.easeInOut(duration: 0.7), value: onboardingIndex)
    }
}


#Preview {
    OnboardingView()
}

 
