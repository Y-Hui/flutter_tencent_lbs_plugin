package com.flutter_tencent_lbs_plugin.models


fun Map<*, *>.getString(key: String, defaultValue: String? = null): String? {
    val value = this[key]
    return if (value is String) {
        value
    } else {
        defaultValue
    }
}

fun Map<*, *>.getInt(key: String, defaultValue: Int): Int {
    val value = this[key]
    return if (value is Int) {
        value
    } else {
        defaultValue
    }
}

fun Map<*, *>.getBoolean(key: String, defaultValue: Boolean = false): Boolean {
    val value = this[key]
    return if (value is Boolean) {
        value
    } else {
        defaultValue
    }
}

fun Map<*, *>.getMap(key: String): Map<*, *>? {
    val value = this[key]
    return if (value is Map<*, *>) {
        value
    } else {
        null
    }
}

data class NotificationOptions(
    val id: Int,
    val channelId: String,
    val channelName: String,
    val channelDescription: String?,
    val contentTitle: String,
    val contentText: String,
    val enableVibration: Boolean,
    val playSound: Boolean,
    val showWhen: Boolean,
    val iconData: NotificationIconData?,
) {
    companion object {
        fun getData(json: Map<*, *>?): NotificationOptions {
            val id = json?.getInt("id", 1000) ?: 1000
            val channelId = json?.getString("channelId") ?: "foreground_service"
            val channelName = json?.getString("channelName") ?: "Foreground Service"
            val channelDesc = json?.getString("channelDescription")
            val contentTitle = json?.getString("notificationTitle") ?: ""
            val contentText = json?.getString("notificationText") ?: ""
            val enableVibration = json?.getBoolean("enableVibration") ?: false
            val playSound = json?.getBoolean("playSound") ?: false
            val showWhen = json?.getBoolean("showWhen") ?: false

            val iconDataJson = json?.getMap("iconData")
            var iconData: NotificationIconData? = null
            if (iconDataJson != null) {
                iconData = NotificationIconData(
                    resType = iconDataJson.getString("resType") ?: "",
                    resPrefix = iconDataJson.getString("resPrefix") ?: "",
                    name = iconDataJson.getString("name") ?: "",
                    backgroundColorRgb = iconDataJson.getString("backgroundColorRgb")
                )
            }

            return NotificationOptions(
                id = id,
                channelId = channelId,
                channelName = channelName,
                channelDescription = channelDesc,
                contentTitle = contentTitle,
                contentText = contentText,
                enableVibration = enableVibration,
                playSound = playSound,
                showWhen = showWhen,
                iconData = iconData,
            )
        }
    }
}
