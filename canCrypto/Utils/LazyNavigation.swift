//
//  LazyNavigation.swift
//  canCrypto
//
//  Created by Maciej on 23/03/2023.
//

import SwiftUI

struct LazyNavigation<Content: View> : View {
    let build: () -> Content
    
    init(_ build: @autoclosure @escaping() -> Content) {
        self.build = build
    }
    
    var body: Content {
        build()
    }
}
