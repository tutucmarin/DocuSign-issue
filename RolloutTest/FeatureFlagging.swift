//
//  FeatureFlagging.swift
//  Marin
//
//  Created by Marin Tutuc on 10/28/20.
//  Copyright © 2020 Marin Tutuc. All rights reserved.
//

import Foundation
import ROX
import ROXCore

class FeatureFlagging: RoxContainer {
    
    // MARK: - Initialization

    static let shared = FeatureFlagging()

    private init() {}

    class func config() {
        
        ROX.register("", container: FeatureFlagging.shared)

        let options = RoxOptions()

        options.defaultFreezeLevel = .none
        
        options.onConfigurationFetched = { result in
            
            if result.fetcherStatus == .appliedFromNetwork
            {
                print("FEATURE_FLAG - STATUS: \(result.fetcherStatus.rawValue) | HAS CHANGES \(result.hasChanges)")
                
                print("FEATURE_FLAG - VALUE: \(FeatureFlagging.shared.docuSignTest.value())")
                
                print("FEATURE_FLAG ================================================")
            }
        }

        ROX.setup(withKey: "5f99581c8dfc0852617df28d", options: options)
    }

    // MARK: - Flags
    let docuSignTest = ROXVariant(withDefault: "local_value")
}

enum CameraQualityType: Int, CaseIterable {
    case hd
    case sd
}
