//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Hassan Sohail Dar on 7/12/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]),
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Brisbane, Queensland")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
//                    .background(Color.blue)
//                    .frame(width: 200, height: 200)
                    .padding()
                Spacer() //basically used to move the text to the top of the frame
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
