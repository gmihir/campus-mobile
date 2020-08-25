//
//  ScannerViewFactory.swift
//  Runner
//
//  Created by Mihir Gupta on 8/25/20.
//  Copyright © 2020 The Chromium Authors. All rights reserved.
//

import Foundation

public class ScannerViewFactory : NSObject, FlutterPlatformViewFactory {
    public func create(withFrame frame: CGRect, viewIdentifier viewId: Int64, arguments args: Any?) -> FlutterPlatformView {
        return ScannerView(frame, viewId: viewId, args: args)
    }
}
