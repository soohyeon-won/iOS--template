//
//  Destination.swift
//  Project
//
//  Created by won soohyeon on 2/12/24.
//  참고: https://labs.brandi.co.kr//2022/12/12/leehs81.html

import SwiftUI
import Combine

import ComposableArchitecture

enum Destination {
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

final class Coordinator: ObservableObject {
    private let isRoot: Bool
    var destination: Destination = .mainView
    var cancellable = Set<AnyCancellable>()
    @Published private var navigationTrigger = false
    @Published private var rootNavigationTrigger = false
    
    init(isRoot: Bool = false) {
        self.isRoot = isRoot
        if isRoot {
            NotificationCenter.default.publisher(for: .popToRoot)
                .sink { [unowned self] _ in
                    rootNavigationTrigger = false
                }
                .store(in: &cancellable)
        }
    }
    
    @ViewBuilder
    func navigationLinkSection() -> some View {
        NavigationLink(isActive: Binding<Bool>(get: getTrigger, set: setTrigger(newValue:))) {
            destination.view
        } label: {
            EmptyView()
        }
    }
    
    func push(destination: Destination) {
        self.destination = destination
        if isRoot {
            rootNavigationTrigger.toggle()
        } else {
            navigationTrigger.toggle()
        }
    }
    
    private func getTrigger() -> Bool {
        isRoot ? rootNavigationTrigger : navigationTrigger
    }
    
    private func setTrigger(newValue: Bool) {
        if isRoot {
            rootNavigationTrigger = newValue
        } else {
            navigationTrigger = newValue
        }
    }
    
    func popToRoot() {
      NotificationCenter.default.post(name: .popToRoot, object: nil)
    }
}

extension Notification.Name {
  static let popToRoot = Notification.Name("PopToRoot")
}
