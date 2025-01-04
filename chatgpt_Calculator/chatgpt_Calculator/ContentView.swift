//
//  ContentView.swift
//  chatgpt_Calculator
//
//  Created by Bharath Kumar Potham Shetti on 12/22/24.
//

import SwiftUI

struct ContentView: View {
    @State var inputtext : String = ""
    var body: some View {
        NavigationStack{
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                TextField("enter the text",text: $inputtext)
                    .font(.title)
                    .foregroundColor(.purple)
                    .padding()
                    .background(.pink.opacity(0.2))
                    .cornerRadius(10)
                NavigationLink( destination: Page2View(text3: $inputtext)){
                    Label("go to page2", systemImage: "timer")
                }
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
