//
//  ContentView.swift
//  Project
//
//  Created by won soohyeon on 12/10/23.
//

import SwiftUI

import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<ContentReducer>
    
    var body: some View {
        WithViewStore(store, observe: {$0}) { viewStore in
            VStack {
                Button(action: {
                    viewStore.send(.tapBtn)
                }, label: {
                    Text("Button")
                })
                
                Text("TCA: \(String(describing: viewStore.state.isComplete))")
            }
        }
    }
}

#Preview {
    ContentView(store: Store(initialState: ContentReducer.State()) {
        ContentReducer()
    })
}
