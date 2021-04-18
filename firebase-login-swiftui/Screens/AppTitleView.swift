//
//  AppTitleView.swift
//  firebase-login-swiftui
//
//  Created by Ana Carolina de Sousa Ferreira on 18/04/21.
//

import SwiftUI

struct AppTitleView: View {
    var title: String
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("Firebase Login")
                    .font(.system(size: 24))
                    .fontWeight(.ultraLight)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
                
                Text(title)
                    .font(.system(size: 72))
                    .fontWeight(.ultraLight)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .topLeading)
            }
        }
        .padding(.top, 30)
        .padding(.leading, 10)
        .background(Color.init(red: 0.9, green: 0.9, blue: 0.9))
        .shadow(radius: 21)
    }
}

struct AppTitleView_Previews: PreviewProvider {
    static var previews: some View {
        AppTitleView(title: "Example")
    }
}
