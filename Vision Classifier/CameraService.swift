//
//  CameraService.swift
//  Vision Classifier
//
//  Created by Amarra Houraney on 10/2/25.
//

import AVFoundation
import Combine


final class CameraService: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
    let session = AVCaptureSession()
    var onFrame: ((CVPixelBuffer) -> Void)?
    
    private let videoQueue = DispatchQueue(label: "videoQueue")
    private(set) var currentPosition: AVCaptureDevice.Position = .back
    private var videoOutput: AVCaptureVideoDataOutput?
    
    override init() {
        super.init()
        configureSession()
    }
    
    private func configureSession() {
        session.beginConfiguration()
        session.sessionPreset = .high
        
    // 1) input (from currentPosition)
        guard
            let device = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: currentPosition),
            let input = try? AVCaptureDeviceInput(device: device),
            session.canAddInput(input)
        else {
            print("Could not create/add camera input")
                session.commitConfiguration()
                return
        }
    }
    session.addInput(input)
    
    //output
    let output = AVCaptureVideoDataOutput()
    output.videoSettings = [kCVPixelBufferPixelFormatTypeKey as String: kCVPixelFormatType_32BGRA]
    output.alwaysDiscardsLateVideoFrames = true
    output.setSampleBufferDelegate(self, queue: videoQueue)
    if session.canAddOutput(output) {
        session.addOutput(output)
    }
    self.videoOutput = output
    
    // orientation and mirroring
    
    
    
    
}
