//
//  MainView.swift
//  Project
//
//  Created by won soohyeon on 12/10/23.
//

import SwiftUI

import ComposableArchitecture

struct MainView: View {
    
    @StateObject var coordinator: Coordinator = .init(isRoot: true)
    let store: StoreOf<MainReducer>
    
    var body: some View {
        WithViewStore(store, observe: {$0}) { viewStore in
            NavigationView {
                VStack {
                    Button(action: {
                        viewStore.send(.tapBtn)
                    }, label: {
                        Text("Toggle Button")
                    })
                    
                    Text("Toggle Button isComplete: \(String(describing: viewStore.state.isComplete))")
                    
                    TextField("텍스트 작성: ", text: viewStore.$description)
                    
                    Text("입력된 데이터: \(viewStore.description)")
                    
                    coordinator.navigationLinkSection()
                    
                    Button {
                      coordinator.push(destination: .subView(store: store))
                    } label: {
                      Image(systemName: "c.square.fill")
                    }
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .navigationTitle("")
            }
        }
    }
}

#Preview {
    MainView(store: Store(initialState: MainReducer.State()) {
        MainReducer()
    })
}
