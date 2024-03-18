//
//  AuthView.swift
//  Real_Reg&Login_App
//
//  Created by Mohamed Abd Elhakam on 11/03/2024.
//

import SwiftUI

struct AuthView: View {
    @StateObject var viewModel = AuthViewModel()
    
    var body: some View {
        NavigationView {
            ZStack
            {
                VStack(spacing: 50) {
                    SocialMediaButton
                    textfield
                    signinView
                    
                }// Vstack
                if viewModel.isLoading{
                    ProgressView()
                        .progressViewStyle(.circular)
                        .padding()
                        .scaleEffect(2)
                }
                
            }// Zstack
            .padding()
            .navigationTitle(viewModel.registerUser ? AppStrings.Login.title : AppStrings.Signup.title)
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .cancel())
            })
            
        }//NavigationView
        .onAppear{
            viewModel.rest()
        }
    }
    
    private var SocialMediaButton : some View {
        VStack{
            Button(AppStrings.Signup.Button.apple) {
                
            }.buttonStyle(.customButtonStyle())
            Button(AppStrings.Signup.Button.google) {
                
            }.buttonStyle(.customButtonStyle())
        }
    }
    
    private var textfield : some View {
        VStack(spacing: 16){
            if !viewModel.registerUser {
                PrimaryTextfield(placeHolder: AppStrings.Signup.Textfield.name, text: $viewModel.name)
                PrimaryTextfield(placeHolder: AppStrings.Signup.Textfield.phone, text: $viewModel.phone)
            }
            PrimaryTextfield(placeHolder: AppStrings.Signup.Textfield.email, text: $viewModel.email)
            PrimaryTextfield(placeHolder: AppStrings.Signup.Textfield.password, text: $viewModel.password ,secured: true)
            
            Button( viewModel.registerUser ? AppStrings.Login.Button.login : AppStrings.Signup.Button.signup ) {
                
                if viewModel.registerUser{
                    viewModel.LogIn()
                }else {
                    viewModel.SignUp()
                }
                
            }.buttonStyle(.customButtonStyle())
        }
        .autocorrectionDisabled(true)
        .textInputAutocapitalization(.never)
    }
    
    private var signinView : some View {
        HStack
        {
            Text(viewModel.registerUser ? AppStrings.Signup.Text.notmember : AppStrings.Signup.Text.signin)
            Button(viewModel.registerUser ?  AppStrings.Signup.Button.signup : AppStrings.Login.Button.login) {
                withAnimation {
                    //MARK: change between signUp and LogIn
                    viewModel.registerUser.toggle()
                }
               
            }
            .foregroundColor(.primaryButton)
        }
    }
    
    
}

#Preview {
    AuthView()
}
