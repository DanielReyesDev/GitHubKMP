package com.skylabs.presentation

// Inherits from BaseView

interface MembersView : BaseView {
    var isUpdating: Boolean
    fun onUpdate(members: String)
}