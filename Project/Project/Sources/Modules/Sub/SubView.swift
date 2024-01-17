//
//  SubView.swift
//  Project
//
//  Created by won soohyeon on 1/17/24.
//

import SwiftUI

import ComposableArchitecture

struct SubView: View {
    let store: StoreOf<MainReducer>
    
    var body: some View {
        WithViewStore(store, observe: {$0}) { viewStore in
            VStack {
            }
        }
    }
}
