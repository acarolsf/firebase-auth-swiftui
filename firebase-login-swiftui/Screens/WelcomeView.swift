//
//  WelcomeView.swift
//  firebase-login-swiftui
//
//  Created by Ana Carolina de Sousa Ferreira on 18/04/21.
//

import SwiftUI
import Firebase


struct WelcomeView: View {
    
    @State var signUpIsPresent: Bool = false
    @State var signInIsPresent: Bool = false
    @State var selection: Int? = nil
    @State var viewState = CGSize.zero
    @State var MainViewState = CGSize.zero
    
    var body: some View {
        ZStack {
            if Auth.auth().currentUser != nil {
                VStack {
                    AppTitleView(title: "Home")
                    Spacer()
                    Text("Hello World")
                    Spacer()

                    Button(action: {
                        let firebaseAuth = Auth.auth()
                        do {
                            try firebaseAuth.signOut()
                        } catch let signOutError as NSError {
                            print("Error sigining out : %@", signOutError)
                        }
                        self.MainViewState = CGSize(width: screenWidth, height: 0)
                        self.viewState = CGSize(width: 0, height: 0)
                    }, label: {
                        Text("SignOut").foregroundColor(.white).padding()
                    }).background(Color.green)
                    .cornerRadius(5)
                }.edgesIgnoringSafeArea(.top).background(Color.white)
                .offset(x: self.MainViewState.width).animation(.spring())
            }
            else {
                VStack {
                    AppTitleView(title: "Welcome")
                    Spacer()
                    VStack(spacing: 20) {
                        Button(action: {
                            self.signUpIsPresent = true
                        }) {
                            Text("SignUp")
                        }.sheet(isPresented: self.$signUpIsPresent) {
                            SignUpView()
                        }
                        
                        Button(action: {self.signInIsPresent = true}) {
                            Text("SignIn")
                        }.sheet(isPresented: self.$signInIsPresent) {
                            SignInView {
                                self.viewState = CGSize(width: screenWidth, height: 0)
                                self.MainViewState = CGSize(width: 0, height: 0)
                            }
                        }
                        
                        Spacer()
                        
                    }.edgesIgnoringSafeArea(.top).edgesIgnoringSafeArea(.bottom)
                    .offset(x: self.viewState.width).animation(.spring())
                }
            }
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
