//
//  ScannerView.swift
//  Runner
//
//  Created by Mihir Gupta on 8/25/20.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation
import ScanditCaptureCore
import ScanditBarcodeCapture
import ScanditParser

extension DataCaptureContext {
    private static let licenseKey = "ASqOeBF0Du8nJ4cPHkBhSkQEBHR0AbRatlFn9qxVt3dtYVgNE2wqGOIn3hIAe8yfv0h6/oVV0QLscCBOWnXf6eQSJjTzRg8iByC+wnF8LgcSTWIvDW8HQ4d16pEsf6D+LUb9RulF+aJ/Ek8Xwyw4Tt3BLuWSatR6Q83Hr19eoyZ2dGHpxzKuvlgjXdwf2QGHwlbF0Fe5tkJX97ao8n3W/2zP2Z4hyWacy3W4zygb/8WIZHAT1xqsMoMNP5RFy84URXq+iYElekEvNSelZInASZfiCH0XL9RARbwMBkh98NY4lRDZT6NYBU3/jr2fy8Pjoc7BWPjAknj6vScx30OwDWq0pN43DeW4IRGfaLXvxm7+Yq2rktwrs2RK0su8RNrDGXre5M6ZJoxadjEwyEkrYA5L9S7jP8vHBVUIxCvsFqNV8PtRuaWIMPDTmPsH0QZvxQld434mNqbIwp5FesB5W2jVvaYLaPuCKe8lmXnEilFx/vbOFRIb9yfJJm/NNtnawlGtN63S7p9TRwpuRfzrryDxN6gR6z14EtP21Z5rY6VEytZiMxUjuuGheD91BwcCus8MB+PKXrAYv3UPLpDrM8AYlXI974y79Hqt4dMoDQnX0hAPM1SQbRjhaIIq8NFA5tFXez9LOyACRsCszZ79oPmPJNgS0QcxzS8uUwZMwSYaiRjB0ITIKBi3LrOBokldtMQBHmoO72RtrmuUQS4su9A2tKPeEI3kg/aJ7YVurBOkDjbn81uoZFK2qi8VvA0PukbSpbpIQwQNhlezM0Mj7gC0bQMC8FYIY7QCyJd8Bv93/BEN9G9AuCW9Ut8X9Q=="

    // Get a licensed DataCaptureContext.
    static var licensed: DataCaptureContext {
        return DataCaptureContext(licenseKey: licenseKey)
    }
}


public class ScannerView : NSObject, FlutterPlatformView {
    
    private var context: DataCaptureContext!
    private var camera: Camera?
    private var barcodeCapture: BarcodeCapture!
    private var captureView: DataCaptureView!
    private var overlay: BarcodeCaptureOverlay!
    
    
    public func configureScanner() {
        let settings = BarcodeCaptureSettings()
        settings.set(symbology: .dataMatrix, enabled: true)
        settings.set(symbology: .qr, enabled: true)
        settings.set(symbology: .code128, enabled: true)
        
        let symbologySettings = settings.settings(for: .dataMatrix)
        symbologySettings.isColorInvertedEnabled = true
        
        barcodeCapture = BarcodeCapture(context: context, settings: settings)        
    }
    
    public func view() -> UIView {
        return UISlider(frame: frame)
    }
    
    let frame: CGRect
    let viewId : Int64
    
    init(_ frame: CGRect, viewId: Int64, args: Any?) {
        self.frame = frame
        self.viewId = viewId
    }
}
