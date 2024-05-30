//
//  CarouselView.swift
//  test
//
//  Created by Ledger Heath on 2023/12/27.
//

import SwiftUI

struct CarouselView: View {
    
    var radius: Int = 150
    var interval: TimeInterval = 2.0

    @State var activeIndex: Int = 0
    
    var views: [CarouselViewChild] = testCarouselChildView
    
    var body: some View {
        ZStack {
            ForEach(views) { view in
                view
                    .scaleEffect(1.0 - abs(distance(view.id)) * 0.2)
                    .offset(x: getOffset(view.id), y: 0)
                    .zIndex(1.0 - abs(distance(view.id)) * 0.2)
                    .opacity(1.0 - abs(distance(view.id)) * 0.15)
            }
        }
        .onAppear {
            startAutoPlay()
        }
    }
    
    func distance(_ index: Int) -> Double {
        return (Double(activeIndex - index))
    }
    
    func getOffset(_ index: Int) -> Double {
        let angle = Double.pi * 2 / Double(views.count) * distance(index)
        return sin(angle) * Double(radius)
    }
    
    func startAutoPlay() {
        Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
            withAnimation {
                activeIndex = (activeIndex + 1) % views.count
                print(activeIndex)
            }
        }
    }

}

struct CarouselView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselView()
    }
}

var testCarouselChildView: [CarouselViewChild] = [
    CarouselViewChild(id: 0, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 100)
                .fill(Color.red)
            Text("0")
                .padding()
        }
        .frame(width: 200, height: 200)
    }),
    
    CarouselViewChild(id: 1, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 100)
                .fill(Color.blue)
            Text("1")
                .padding()
        }
        .frame(width: 200, height: 200)
    }),
    
    CarouselViewChild(id: 2, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 100)
                .fill(Color.green)
            Text("2")
                .padding()
        }
        .frame(width: 200, height: 200)
    }),
    
    CarouselViewChild(id: 3, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 100)
                .fill(Color.mint)
            Text("3")
                .padding()
        }
        .frame(width: 200, height: 200)
    }),
    
    CarouselViewChild(id: 4, content: {
        ZStack{
            RoundedRectangle(cornerRadius: 100)
                .fill(Color.gray)
            Text("4")
                .padding()
        }
        .frame(width: 200, height: 200)
    })
]
