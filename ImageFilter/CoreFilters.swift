//
//  CoreFilers.swift
//  ImageFilter
//
//  Created by MAHFUJ on 23/1/23.
//

import Foundation


struct CoreFilters {
//    static let ZoomBlur = "CIZoomBlur"
//    static let ColorClamp = "CIColorClamp"
//    static let HueAdjust = "CIHueAdjust"
//    static let ToneCurve = "CIToneCurve"
//    static let Noir = "CIPhotoEffectNoir"
//    static let cepia = "CISepiaTone"
//    static let Vignette = "CIVignette"
//    static let Mono = "CIPhotoEffectMono"
    
    static func filterByTag(tag: Int) -> String { // type level function
        switch tag {
        case 1:
            return "CIZoomBlur"
        case 2:
            return "CIColorClamp"
        case 3:
            return "CIHueAdjust"
        case 4:
            return "CIToneCurve"
        case 5:
            return "CIPhotoEffectNoir"
        case 6:
            return "CISepiaTone"
        case 7:
            return "CIVignette"
        case 8:
            return "CIPhotoEffectMono"
        default:
            return ""
        }
    }
}

