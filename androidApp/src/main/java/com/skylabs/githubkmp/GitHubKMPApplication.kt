package com.skylabs.githubkmp

import android.app.Application
import com.skylabs.api.GithubApi
import com.skylabs.model.MembersDataRepository
import com.skylabs.presentation.DataRepository

class GitHubKMPApplication : Application() {

    val dataRepository: DataRepository by lazy {
        MembersDataRepository(GithubApi())
    }


}