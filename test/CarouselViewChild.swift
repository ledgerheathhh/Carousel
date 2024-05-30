//
//  CarouselViewChild.swift
//  test
//
//  Created by Ledger Heath on 2023/12/27.
//

import SwiftUI

struct CarouselViewChild: View, Identifiable {
    var id:Int
    @ViewBuilder var content: any View
    
    var body: some View {
        AnyView(content)
    }
}
