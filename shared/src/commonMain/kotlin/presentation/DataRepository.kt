package com.skylabs.presentation

import com.skylabs.model.Member

interface DataRepository {
    val members: List<Member>?
    var onRefreshListeners: List<() -> Unit>

    suspend fun update()
}