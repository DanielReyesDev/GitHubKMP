package com.skylabs.presentation

import com.skylabs.ApplicationDispatcher
import kotlinx.coroutines.launch

// The MembersPresenter will have attached the dispatcher and the view


class MembersPresenter(
    private val view: MembersView,
    private val repository: DataRepository
) : CoroutinePresenter(ApplicationDispatcher, view) {

    // to map the private showData() function
    private val onRefreshListener: () -> Unit = this::showData

    override fun onCreate() {
        view.isUpdating = isFristDataLoading()
        repository.onRefreshListeners += onRefreshListener
        showData()
        updateData()
    }

    override fun onDestroy() {
        super.onDestroy()
        repository.onRefreshListeners -= onRefreshListener
    }

    private fun showData() {
        view.onUpdate(repository.members ?: "No members")
    }

    private fun updateData() {
        launch {
            repository.update()
            showData()
        }.invokeOnCompletion {
            view.isUpdating = false
        }
    }

    private fun isFristDataLoading() = repository.members == null


}