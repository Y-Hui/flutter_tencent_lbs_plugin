package com.flutter_tencent_lbs_plugin.models

import com.tencent.map.geolocation.TencentLocationManager
import com.tencent.map.geolocation.TencentLocationRequest

fun getInt(json: Map<*, *>?, key: String): Int? {
    if (json == null) {
        return null
    }
    val value = json[key]
    return if (value is Int) {
        value
    } else {
        null
    }
}

fun getBoolean(json: Map<*, *>?, key: String): Boolean? {
    if (json == null) {
        return null
    }
    val value = json[key]
    return if (value is Boolean) {
        value
    } else {
        null
    }
}

fun getMap(json: Map<*, *>?, key: String): Map<*, *>? {
    if (json == null) {
        return null
    }
    val value = json[key]
    return if (value is Map<*, *>?) {
        value
    } else {
        null
    }
}

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
                requestLevel = getInt(json, "requestLevel") ?: request.requestLevel,
                coordinateType = getInt(json, "coordinateType") ?: locationManager.coordinateType,
                mockEnable = getBoolean(json, "mockEnable") ?: false,
                locMode = getInt(json, "locMode") ?: TencentLocationRequest.HIGH_ACCURACY_MODE,
                isAllowGPS = getBoolean(json, "isAllowGPS") ?: request.isAllowGPS,
                isIndoorLocationMode = getBoolean(json, "isIndoorLocationMode")
                    ?: request.isIndoorLocationMode,
                isGpsFirst = getBoolean(json, "isGpsFirst") ?: request.isGpsFirst,
                gpsFirstTimeOut = getInt(json, "gpsFirstTimeOut") ?: request.gpsFirstTimeOut,
            )
        }
    }
}
