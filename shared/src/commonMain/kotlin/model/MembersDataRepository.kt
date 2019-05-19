package com.skylabs.model

import com.skylabs.api.GithubApi
import com.skylabs.api.UpdateProblem
import com.skylabs.presentation.DataRepository

class MembersDataRepository(private val api: GithubApi) : DataRepository {

    // tip: ctr + i and select all the required methods and properties from the base class DataRepository

    override var members: List<Member>? = null

    override var onRefreshListeners: List<() -> Unit> = emptyList()

    // Calling API to get new results
    override suspend fun update() {
        val newMembers = try {
            api.getMembers()
        } catch( cause: Throwable) {
            throw UpdateProblem()
        }

        if (newMembers != members) {
            members = newMembers
            callRefreshListeners()
        }
    }

    private fun callRefreshListeners() {
        // Goes through all the listeners and calls each one
        onRefreshListeners.forEach { it() }
    }
}