package com.flutter_tencent_lbs_plugin.models

import com.tencent.map.geolocation.TencentLocationManager
import com.tencent.map.geolocation.TencentLocationRequest
import com.flutter_tencent_lbs_plugin.utils.JsonUtils

data class InitOptions(
    val coordinateType: Int,
    val mockEnable: Boolean,
    val requestLevel: Int,
    val locMode: Int,
    val isAllowGPS: Boolean,
    val isIndoorLocationMode: Boolean,
    val isGpsFirst: Boolean,
    val gpsFirstTimeOut: Int,
) {
    companion object {
        fun getData(
            locationManager: TencentLocationManager,
            request: TencentLocationRequest,
            json: Map<*, *>?
        ): InitOptions {
            return InitOptions(
                requestLevel = JsonUtils.getInt(json, "requestLevel") ?: request.requestLevel,
                coordinateType = JsonUtils.getInt(json, "coordinateType") ?: locationManager.coordinateType,
                mockEnable = JsonUtils.getBoolean(json, "mockEnable") ?: false,
                locMode = JsonUtils.getInt(json, "locMode") ?: TencentLocationRequest.HIGH_ACCURACY_MODE,
                isAllowGPS = JsonUtils.getBoolean(json, "isAllowGPS") ?: request.isAllowGPS,
                isIndoorLocationMode = JsonUtils.getBoolean(json, "isIndoorLocationMode") ?: request.isIndoorLocationMode,
                isGpsFirst = JsonUtils.getBoolean(json, "isGpsFirst") ?: request.isGpsFirst,
                gpsFirstTimeOut = JsonUtils.getInt(json, "gpsFirstTimeOut") ?: request.gpsFirstTimeOut
            )
        }
    }
}
