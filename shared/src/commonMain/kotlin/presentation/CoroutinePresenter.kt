package com.skylabs.presentation

import kotlinx.coroutines.CoroutineExceptionHandler
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Job
import kotlin.coroutines.CoroutineContext

// since the base class is CoroutineScope, it's required to hold a CoroutineContext in the constructor:
// and also we're passing a BaseView in the constructor. making it an abstract class

abstract class CoroutinePresenter(
    private val presenterContext: CoroutineContext,
    private val baseView: BaseView
) : CoroutineScope {

    private val job = Job()

    private val exceptionHandler = CoroutineExceptionHandler { _, throwable ->
        baseView.showError(throwable)
    }

    override val coroutineContext: CoroutineContext
        get() = presenterContext + job + exceptionHandler

    // All presenters must implement this function
    abstract fun onCreate()

    // Default onDestroy to cancel all jobs
    open fun onDestroy() {
        job.cancel()
    }
}