package com.skylabs.presentation

import com.skylabs.model.Member

// Inherits from BaseView

interface MembersView : BaseView {
    var isUpdating: Boolean
    fun onUpdate(members: List<Member>)
}