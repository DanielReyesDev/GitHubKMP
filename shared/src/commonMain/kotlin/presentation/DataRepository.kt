package com.skylabs.presentation

interface DataRepository {
    val members: String?
    var onRefreshListeners: List<() -> Unit>

    suspend fun update()
}