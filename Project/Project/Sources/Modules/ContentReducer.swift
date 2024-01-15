//
//  ContentReducer.swift
//  Project
//
//  Created by won soohyeon on 1/10/24.
//

import Foundation
import Combine

import ComposableArchitecture

@Reducer
struct ContentReducer {
    
    struct State: Equatable {
        var isComplete = false
    }
    
    enum Action: Equatable {
        case tapBtn
    }
    
    var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .tapBtn:
                state.isComplete.toggle()
                return .none
            }
        }
    }
}
