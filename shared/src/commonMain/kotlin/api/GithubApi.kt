package com.skylabs.api

import io.ktor.client.HttpClient
import io.ktor.client.request.get
import io.ktor.client.request.url
import io.ktor.http.Url

class GithubApi {
    private val client = HttpClient()

    private val membersUrl = Url("https://api.github.com/orgs/raywenderlich/members")

    /* Coroutines:

       the suspend keyword denotes that is running from a coroutine and the process can be suspended within the coroutine
     With suspend, you can suspend the coroutine while other tasks run.

     CoroutineContext: represents the context that the coroutine can access while is executing, e.g. the name, dispatcher, and job.
      parts:
        a) a Job that contains background work that is cancellable
        b) a Dispatcher, which provides threads the coroutine uses for execution.

     CoroutineScope: an interface used to specify a CoroutineContext


     Coroutine Builders: launch, async, runBlocking

     */
    suspend fun getMembers(): String {
        val result: String = client.get {
            url(this@GithubApi.membersUrl.toString())
        }
        return result
    }
}