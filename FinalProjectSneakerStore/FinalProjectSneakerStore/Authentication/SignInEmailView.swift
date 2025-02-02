//
//  SignInEmailViewModel.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 01.02.2025.
//


import SwiftUI
import Firebase
import FirebaseAuth

@MainActor
final class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isSignedIn = false
    @Published var showErrorNotification = false

    func signIn() {
        
        guard !email.isEmpty, !password.isEmpty else {
            errorMessage = "Please enter both email and password."
            showErrorNotification = true
            return
        }

        
        Task {
            do {
                let result = try await Auth.auth().signIn(withEmail: email, password: password)
                print("Signed in successfully: \(result.user.uid)")
                isSignedIn = true
            } catch {
                errorMessage = error.localizedDescription
                print("Sign in error: \(error)")
            }
        }
    }
}


struct SignInEmailView: View {
    @StateObject private var viewModel = SignInViewModel()
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        ScrollView {
            ZStack {
                VStack(spacing: 16) {
                    TextField("Email", text: $viewModel.email)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)
                        .padding(.bottom, 50)
                    
                    Button(action: {
                        viewModel.signIn()
                    }) {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.black)
                            .cornerRadius(20)
                    }
                    
                    if viewModel.showErrorNotification {
                        ErrorNotificationView(message: viewModel.errorMessage)
                            .transition(.scale.combined(with: .opacity))
                            .onAppear {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    withAnimation {
                                        viewModel.showErrorNotification = false
                                    }
                                }
                            }
                    }
                }
                
            }
            .padding()
            .padding(.bottom, 400)
            .ignoresSafeArea(.keyboard)
            
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.black)
                    }
                }
                ToolbarItem(placement: .principal) {
                                Text("Welcome back!")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(.black)
                            }
            }
            
            
            NavigationLink(destination: MainScreenView(), isActive: $viewModel.isSignedIn) {
                EmptyView()
            }
        }
    }
}

struct SignInEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignInEmailView()
    }
}
