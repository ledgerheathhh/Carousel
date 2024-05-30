//
//  ContentView.swift
//  test
//
//  Created by Ledger Heath on 2023/12/27.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CarouselView(views: getChildViews())
    }
    
    func getChildViews() -> [CarouselViewChild] {
        var tempViews: [CarouselViewChild] = []
        
        for i in (0...9) {
            tempViews.append(CarouselViewChild(id: i, content: {
                ZStack{
                    Image("\(i)")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .mask {
                            RoundedRectangle(cornerRadius: 100)
                                .frame(width: 200,height: 200)
                        }
                }
                .frame(width: 200,height: 200)
            }))
        }
        
        return tempViews
    }
}

#Preview {
    ContentView()
}
