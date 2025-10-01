//
//  DetectionModel.swift
//  Vision Classifier
//
//  Created by Amarra Houraney on 9/30/25.
//
// foundation allows ability to set unique user ids so you can access things in the model from outside the model
import Foundation
import CoreGraphics

// struct and classes in swift is slightly different than C++
// identifiable
struct DetectionModel: Identifiable {
    let id: UUID = UUID()  // universable user ID is a swift data structure
    let label: String
    let score: Double
    let normalizedBounds: CGRect  // CGRect data type requires Core Graphics library, it is a rectangle that we can programatically work with
}

