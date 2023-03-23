//
//  CustomLoadingIndicator.swift
//  canCrypto
//
//  Created by Maciej on 23/03/2023.
//

import SwiftUI

struct LoadingIndicator: View {
    var body: some View {
        ProgressView()
            .progressViewStyle(.circular)
            .tint(.primary)
            .scaleEffect(x: 1.5, y: 1.5, anchor: .center)
            .frame(width: 80, height: 80)
            .background(Color(.systemGray6))
            .clipShape(Circle())
    }
}

struct CustomLoadingIndicator_Previews: PreviewProvider {
    static var previews: some View {
        LoadingIndicator()
    }
}
