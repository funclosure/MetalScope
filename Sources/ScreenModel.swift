//
//  ScreenModel.swift
//  MetalScope
//
//  Created by Jun Tanaka on 2017/01/23.
//  Copyright © 2017 eje Inc. All rights reserved.
//

import UIKit

public enum ScreenModel {
    case iPhone4
    case iPhone5
    case iPhone6
    case iPhone6Plus
    case iPhoneX
    case iPhoneXR
    case iPhoneXsMax
    case iPhone12
    case iPhone12mini
    case iPhone12ProMax
    case custom(parameters: ScreenParametersProtocol)

    public static let iPhone4s = ScreenModel.iPhone4
    public static let iPhone5s = ScreenModel.iPhone5
    public static let iPhone5c = ScreenModel.iPhone5
    public static let iPhoneSE = ScreenModel.iPhone5
    public static let iPhone6s = ScreenModel.iPhone6
    public static let iPhone6sPlus = ScreenModel.iPhone6Plus
    public static let iPhone7 = ScreenModel.iPhone6
    public static let iPhone7Plus = ScreenModel.iPhone6Plus
    public static let iPhone8 = ScreenModel.iPhone6
    public static let iPhone8Plus = ScreenModel.iPhone6Plus
    public static let iPhoneXs = ScreenModel.iPhoneX
    public static let iPhone11Pro = ScreenModel.iPhoneX
    public static let iPhone11 = ScreenModel.iPhoneXR
    public static let iPhone11ProMax = ScreenModel.iPhoneXsMax
    public static let iPhoneSE2 = ScreenModel.iPhone6
    public static let iPhone12Pro = ScreenModel.iPhone12
    
    
    public static let iPodTouch = ScreenModel.iPhone5

    public static var `default`: ScreenModel {
        return ScreenModel.current ?? .iPhone5
    }

    public static var current: ScreenModel? {
        return ScreenModel(modelIdentifier: currentModelIdentifier) ?? ScreenModel(screen: .main)
    }

    private static var currentModelIdentifier: String {
        var size: size_t = 0
        sysctlbyname("hw.machine", nil, &size, nil, 0)
        var machine: [CChar] = Array(repeating: 0, count: Int(size))
        sysctlbyname("hw.machine", &machine, &size, nil, 0)
        return String(cString: machine)
    }

    private init?(modelIdentifier identifier: String) {
        func match(_ identifier: String, _ prefixes: [String]) -> Bool {
            return prefixes.filter({ identifier.hasPrefix($0) }).count > 0
        }

        switch identifier {
        case "iPod7,1":                                 self = .iPodTouch
        case "iPhone3,1", "iPhone3,2", "iPhone3,3":     self = .iPhone4
        case "iPhone4,1":                               self = .iPhone4s
        case "iPhone5,1", "iPhone5,2":                  self = .iPhone5
        case "iPhone5,3", "iPhone5,4":                  self = .iPhone5c
        case "iPhone6,1", "iPhone6,2":                  self = .iPhone5s
        case "iPhone7,2":                               self = .iPhone6
        case "iPhone7,1":                               self = .iPhone6Plus
        case "iPhone8,1":                               self = .iPhone6s
        case "iPhone8,2":                               self = .iPhone6sPlus
        case "iPhone9,1", "iPhone9,3":                  self = .iPhone7
        case "iPhone9,2", "iPhone9,4":                  self = .iPhone7Plus
        case "iPhone8,4":                               self = .iPhoneSE
        case "iPhone10,1", "iPhone10,4":                self = .iPhone8
        case "iPhone10,2", "iPhone10,5":                self = .iPhone8Plus
        case "iPhone10,3", "iPhone10,6":                self = .iPhoneX
        case "iPhone11,2":                              self = .iPhoneXs
        case "iPhone11,4", "iPhone11,6":                self = .iPhoneXsMax
        case "iPhone11,8":                              self = .iPhoneXR
        case "iPhone12,1":                              self = .iPhone11
        case "iPhone12,3":                              self = .iPhone11Pro
        case "iPhone12,5":                              self = .iPhone11ProMax
        case "iPhone12,8":                              self = .iPhoneSE2
        case "iPhone13,1":                              self = .iPhone12mini
        case "iPhone13,2":                              self = .iPhone12
        case "iPhone13,3", "iPhone13,5":                self = .iPhone12Pro
        case "iPhone13,4", "iPhone13,7":                self = .iPhone12ProMax
//        case "iPad2,1", "iPad2,2", "iPad2,3", "iPad2,4":self = "iPad 2"
//        case "iPad3,1", "iPad3,2", "iPad3,3":           self = "iPad 3"
//        case "iPad3,4", "iPad3,5", "iPad3,6":           self = "iPad 4"
//        case "iPad4,1", "iPad4,2", "iPad4,3":           self = "iPad Air"
//        case "iPad5,3", "iPad5,4":                      self = "iPad Air 2"
//        case "iPad11,3", "iPad11,4":                    self = "iPad Air 3"
//        case "iPad6,11", "iPad6,12":                    self = "iPad 5"
//        case "iPad7,5", "iPad7,6":                      self = "iPad 6"
//        case "iPad2,5", "iPad2,6", "iPad2,7":           self = "iPad Mini"
//        case "iPad4,4", "iPad4,5", "iPad4,6":           self = "iPad Mini 2"
//        case "iPad4,7", "iPad4,8", "iPad4,9":           self = "iPad Mini 3"
//        case "iPad5,1", "iPad5,2":                      self = "iPad Mini 4"
//        case "iPad11,1", "iPad11,2":                    self = "iPad Mini 5"
//        case "iPad6,3", "iPad6,4":                      self = "iPad Pro 9.7 Inch"
//        case "iPad6,7", "iPad6,8":                      self = "iPad Pro 12.9 Inch"
//        case "iPad7,1", "iPad7,2":                      self = "iPad Pro 12.9 Inch (2nd Generation)"
//        case "iPad7,3", "iPad7,4":                      self = "iPad Pro 10.5 Inch"
//        case "iPad8,1", "iPad8,2", "iPad8,3", "iPad8,4":self = "iPad Pro 11 Inch"
//        case "iPad8,9", "iPad8,10":                     self = "iPad Pro 11 Inch (2nd Generation)"
//        case "iPad8,5", "iPad8,6", "iPad8,7", "iPad8,8":self = "iPad Pro 12.9 Inch (3rd Generation)"
//        case "iPad8,11", "iPad8,12":                    self = "iPad Pro 12.9 Inch (4th Generation)"
        default:
            return nil
        }
    }

    private init?(screen: UIScreen) {
        switch screen.fixedCoordinateSpace.bounds.size {
        case CGSize(width: 320, height: 480): self = .iPhone4
        case CGSize(width: 320, height: 568): self = .iPhone5
        case CGSize(width: 375, height: 667): self = .iPhone6
        case CGSize(width: 414, height: 768): self = .iPhone6Plus
        case CGSize(width: 375, height: 812): self = .iPhoneX
        case CGSize(width: 414, height: 896): self = .iPhoneXR
        case CGSize(width: 414, height: 896): self = .iPhoneXsMax
        case CGSize(width: 390, height: 844): self = .iPhone12
        case CGSize(width: 360, height: 780): self = .iPhone12mini
        case CGSize(width: 428, height: 926): self = .iPhone12ProMax
        default:
            return nil
        }
    }
}

extension ScreenModel: ScreenParametersProtocol {
    private var parameters: ScreenParameters {
        switch self {
        case .iPhone4:
            return ScreenParameters(width: 0.075, height: 0.050, border: 0.0045)
        case .iPhone5:
            return ScreenParameters(width: 0.089, height: 0.050, border: 0.0045)
        case .iPhone6:
            return ScreenParameters(width: 0.104, height: 0.058, border: 0.005)
        case .iPhone6Plus:
            return ScreenParameters(width: 0.120, height: 0.065, border: 0.005)
        case .iPhoneX:
            return ScreenParameters(width: 0.126, height: 0.058, border: 0.005)
        case .iPhoneXR:
            return ScreenParameters(width: 0.14, height: 0.065, border: 0.005)
        case .iPhoneXsMax:
            return ScreenParameters(width: 0.14, height: 0.065, border: 0.005)
        case .iPhone12:
            return ScreenParameters(width: 0.131, height: 0.061, border: 0.005)
        case .iPhone12mini:
            return ScreenParameters(width: 0.121, height: 0.056, border: 0.005)
        case .iPhone12ProMax:
            return ScreenParameters(width: 0.144, height: 0.067, border: 0.005)
        case .custom(let parameters):
            return ScreenParameters(parameters)
        }
    }
    
    public var width: Float {
        return parameters.width
    }

    public var height: Float {
        return parameters.height
    }

    public var border: Float {
        return parameters.border
    }
}
