//
//  Destination.swift
//  Project
//
//  Created by won soohyeon on 2/12/24.
//  참고: https://labs.brandi.co.kr//2022/12/12/leehs81.html
//  참고2: https://axiomatic-fuschia-666.notion.site/Chapter-8-Navigation-855a4db02ef346e5b6ff8c35c7db3096

import SwiftUI
import Combine

import ComposableArchitecture

enum DestinationCase {
    case mainView
    case subView(store: StoreOf<MainReducer>)
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .mainView:
            MainView(store: Store(initialState: MainReducer.State()) {
                MainReducer()
            })
        case .subView(let store):
            SubView(store: store)
        }
    }
}

extension Notification.Name {
  static let popToRoot = Notification.Name("PopToRoot")
}

struct Destination2: Reducer {
    enum State {
        case addItem(MainReducer.State)
    }
    enum Action {
        case addItem(MainReducer.Action)
    }
    var body: some ReducerOf<Self> {
        Scope(state: /State.addItem, action: /Action.addItem) {
            MainReducer()
        }
    }
}
