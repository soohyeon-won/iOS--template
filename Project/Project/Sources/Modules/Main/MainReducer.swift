//
//  MainReducer.swift
//  Project
//
//  Created by won soohyeon on 1/10/24.
//

import Foundation
import Combine

import ComposableArchitecture

@Reducer
struct MainReducer {
    
    struct State: Equatable {
        var isComplete = false
        @BindingState var description = ""
    }
    
    enum Action: BindableAction, Sendable {
        case binding(BindingAction<State>)
        case tapBtn
    }
    
    var body: some Reducer<State, Action> {
        BindingReducer()
        Reduce { state, action in
            switch action {
            case .tapBtn:
                state.isComplete.toggle()
                return .none
            case .binding:
                return .none
            }
        }
    }
}
