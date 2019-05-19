package com.skylabs.api

import com.skylabs.model.Member
import io.ktor.client.HttpClient
import io.ktor.client.request.get
import io.ktor.client.request.url
import io.ktor.http.Url
import kotlinx.serialization.json.Json
import kotlinx.serialization.list

class GithubApi {

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

    private val client = HttpClient()
    private val membersUrl = Url("https://api.github.com/orgs/raywenderlich/members")

    suspend fun getMembers(): List<Member> {
        val result: String = client.get {
            url(this@GithubApi.membersUrl.toString())
        }
        return Json.nonstrict.parse(Member.serializer().list, result)
    }
}