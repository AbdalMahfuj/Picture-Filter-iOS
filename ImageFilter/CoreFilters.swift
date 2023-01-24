//
//  CoreFilers.swift
//  ImageFilter
//
//  Created by MAHFUJ on 23/1/23.
//

import Foundation


struct CoreFilters {
    static let ZoomBlur = "CIZoomBlur"
    static let ColorClamp = "CIColorClamp"
    static let HueAdjust = "CIHueAdjust"
    static let ToneCurve = "CIToneCurve"
    static let Noir = "CIPhotoEffectNoir"
    static let cepia = "CISepiaTone"
    static let Vignette = "CIVignette"
    static let Mono = "CIPhotoEffectMono"
    
    static func filterByTag(tag: Int) -> String { // type level function
        switch tag {
        case 1:
            return ZoomBlur
        case 2:
            return ColorClamp
        case 3:
            return HueAdjust
        case 4:
            return ToneCurve
        case 5:
            return Noir
        case 6:
            return cepia
        case 7:
            return Vignette
        case 8:
            return Mono
        default:
            return ""
        }
    }
}

