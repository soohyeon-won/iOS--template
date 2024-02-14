//
//  SubView.swift
//  Project
//
//  Created by won soohyeon on 1/17/24.
//

import SwiftUI

import ComposableArchitecture

struct SubView: View {
    
    @StateObject var coordinator: Coordinator = .init()
    let store: StoreOf<MainReducer>
    
    var body: some View {
        WithViewStore(store, observe: {$0}) { viewStore in
            VStack {
                coordinator.navigationLinkSection()
                Button {
                    coordinator.popToRoot()
                } label: {
                    Text("popToRoot")
                }
            }
        }
    }
}
