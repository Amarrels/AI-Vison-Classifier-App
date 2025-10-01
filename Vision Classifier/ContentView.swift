//
//  ContentView.swift
//  Vision Classifier
//
//  Created by Amarra Houraney on 9/30/25.
//

import SwiftUI

struct ContentView: View {
    
    
    var body: some View {
    @StateObject = private var vm = CameraViewModel()
        
        GeometryReader {geo in
            
            ZStack {
                Color.black.ignoresSafeArea()
                ForEach (vm.detections) { det in
                    let box = pixelRect(from: det.normalizedBounds, in: geo.size)
                    Rectangle()
                        .stroke(.red, lineWidth: 2)
                        .frame(width: box.width, height: box.height)
                        .position(x: box.midX, y: box.midY)
                    Text("\(det.label)\(Int(det.score * 100))%")
                        .font(.caption).bold().
                }
            }
            
        }
        
    }
        
       
}


#Preview {
    ContentView()
}
