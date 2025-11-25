package com.flutter_tencent_lbs_plugin.utils

object JsonUtils {

    fun getInt(json: Map<*, *>?, key: String): Int? {
        if (json == null) return null
        val value = json[key]
        return when (value) {
            is Int -> value
            is Number -> value.toInt()  // 兼容Long、Double等数字类型
            is String -> value.toIntOrNull() // 如果是字符串尝试转Int
            else -> null
        }
    }

    fun getBoolean(json: Map<*, *>?, key: String): Boolean? {
        if (json == null) return null
        val value = json[key]
        return when (value) {
            is Boolean -> value
            is String -> value.toBooleanStrictOrNull() ?: run {
                // 容错处理，"true"/"false"大小写不敏感
                when (value.lowercase()) {
                    "true" -> true
                    "false" -> false
                    else -> null
                }
            }
            else -> null
        }
    }

    fun getString(json: Map<*, *>?, key: String): String? {
        if (json == null) return null
        val value = json[key]
        return when (value) {
            is String -> value
            else -> null
        }
    }

    fun getMap(json: Map<*, *>?, key: String): Map<*, *>? {
        if (json == null) return null
        val value = json[key]
        return if (value is Map<*, *>) value else null
    }
}
