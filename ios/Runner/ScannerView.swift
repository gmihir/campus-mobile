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


public class ScannerView : NSObject, FlutterPlatformView {
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
