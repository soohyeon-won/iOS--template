//
//  Destination.swift
//  Project
//
//  Created by won soohyeon on 2/12/24.
//  참고: https://labs.brandi.co.kr//2022/12/12/leehs81.html

import SwiftUI

import ComposableArchitecture

enum Destination {
    case subView(store: StoreOf<MainReducer>)
    
    @ViewBuilder
    var view: some View {
        switch self {
        case .subView(let store):
            SubView(store: store)
        }
    }
}
