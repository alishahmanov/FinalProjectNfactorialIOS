//
//  SignUpEmailViewModel.swift
//  FinalProjectSneakerStore
//
//  Created by Alihan on 01.02.2025.
//


import SwiftUI
import FirebaseAuth
import Firebase

@MainActor
final class SignUpViewModel: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage = ""
    @Published var registrationSuccessful = false
    @Published var showErrorNotification = false
    @Published var goToMain = false

    func signUp() {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            print("All fields are required")
            errorMessage = "All fields are required."
            showErrorNotification = true
            return
        }
        guard password == confirmPassword else {
            print("Passwords do not match")
            errorMessage = "Passwords do not match."
            showErrorNotification = true
            return
        }

        Task {
            do {
                let returnedUserData = try await AuthenticationManager.shared.createUser(email: email, password: password, username: username )
                print("Account created successfully")
                print(returnedUserData)
                goToMain = true
            } catch {
                print("Error \(error)")
                errorMessage = "This account is already registered."
                showErrorNotification = true
            }
        }
    }
}


struct SignUpEmailView: View {
    @StateObject private var viewModel = SignUpViewModel()
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            ScrollView {
                ZStack {
                    VStack(spacing: 16) {
                        
                        TextField("Username", text: $viewModel.username)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .keyboardType(.emailAddress)
                            .autocapitalization(.none)
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
                        
                        SecureField("Repeat password", text: $viewModel.confirmPassword)
                            .padding()
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(8)
                            .padding(.bottom, 50)
                        
                        Button(action: {
                            viewModel.signUp()
                        }) {
                            Text("Sign Up")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.black)
                                .cornerRadius(20)
                        }
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
            .padding(.horizontal, 20)
            .padding(.bottom, 330)
            .ignoresSafeArea(.keyboard)

                
            }
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(
            leading: Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.black)
            },
            trailing: Text("New User")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(.black)
                .padding(.trailing, 130)
        )

        
        NavigationLink(destination: MainScreenView(), isActive: $viewModel.goToMain) {
            EmptyView()
        }
    }
}

struct ErrorNotificationView: View {
    var message: String

    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(Color.black.opacity(0.9))
            .frame(width: 240, height: 150)
            .overlay(
                InsideErrorNotificationView(message: message)
            )
            .padding(.top, 20)
    }
}

struct InsideErrorNotificationView: View {
    @State private var animateError = false
    var message: String

    var body: some View {
        VStack {
            Image(systemName: "multiply.circle")
                .foregroundColor(.white)
                .font(.system(size: 56))
                .scaleEffect(animateError ? 1.0 : 0.2)
                .animation(
                    .easeInOut(duration: 1.0),
                    value: animateError
                )
                .onAppear {
                    animateError = true
                }

            Text(message)
                .foregroundColor(.white)
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.top, 10)
        }
    }
}

struct SignUpEmailView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpEmailView()
    }
}
