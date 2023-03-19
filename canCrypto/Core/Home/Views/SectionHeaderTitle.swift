//
//  SectionHeader.swift
//  canCrypto
//
//  Created by Maciej on 19/03/2023.
//

import SwiftUI

struct SectionHeaderTitle: View {
    // MARK: - Properties
    let title: String
    
    // MARK: - Init
    init(_ title: String) {
        self.title = title
    }
    
    // MARK: - Body
    var body: some View {
        Text(title)
             .font(.headline)
             .padding(.horizontal)
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeaderTitle("Top Movers")
    }
}
