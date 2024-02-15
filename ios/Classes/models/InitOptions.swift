//
//  InitOptions.swift
//  flutter_tencent_lbs_plugin
//
//  Created by Andrew on 2024/2/15.
//

import Foundation
import TencentLBS

enum CoordinateType: Int {
    case GCJ02 = 0
    case WGS84 = 1
}

enum RequestLevel: Int {
  case Geo       = 0
  case Name      = 1
  case AdminName = 3
  case Poi       = 4
}

class InitOptions {
  var key: String = ""
  var coordinateType: TencentLBSLocationCoordinateType = TencentLBSLocationCoordinateType.WGS84
  var mockEnable: Bool = false
  var requestLevel: TencentLBSRequestLevel = TencentLBSRequestLevel.poi
  var locMode: Int?
  var isAllowGPS: Bool = true
  var isIndoorLocationMode: Bool = false
  var isGpsFirst: Bool = false
  var gpsFirstTimeOut: Int = 5000

  init(dictionary: [String: Any]) {
    if let key = dictionary["key"] as? String {
      self.key = key
    }
    if let coordinateType = dictionary["coordinateType"] as? Int {
      if let value = CoordinateType(rawValue: coordinateType) {
          switch value {
          case .GCJ02:
            self.coordinateType = TencentLBSLocationCoordinateType.GCJ02
          case .WGS84:
            self.coordinateType = TencentLBSLocationCoordinateType.WGS84
          }
      }
    }
    if let mockEnable = dictionary["mockEnable"] as? Bool {
      self.mockEnable = mockEnable
    }
    if let requestLevel = dictionary["requestLevel"] as? Int {
      if let value = RequestLevel(rawValue: requestLevel) {
          switch value {
          case .Geo:
            self.requestLevel = TencentLBSRequestLevel.geo
          case .Name:
            self.requestLevel = TencentLBSRequestLevel.name
          case .AdminName:
            self.requestLevel = TencentLBSRequestLevel.adminName
          case .Poi:
            self.requestLevel = TencentLBSRequestLevel.poi
          }
      }
    }
    if let locMode = dictionary["locMode"] as? Int {
      self.locMode = locMode
    }
    if let isAllowGPS = dictionary["isAllowGPS"] as? Bool {
      self.isAllowGPS = isAllowGPS
    }
    if let isIndoorLocationMode = dictionary["isIndoorLocationMode"] as? Bool {
      self.isIndoorLocationMode = isIndoorLocationMode
    }
    if let isGpsFirst = dictionary["isGpsFirst"] as? Bool {
      self.isGpsFirst = isGpsFirst
    }
    if let gpsFirstTimeOut = dictionary["gpsFirstTimeOut"] as? Int {
      self.gpsFirstTimeOut = gpsFirstTimeOut
    }
  }
}
