package com.skylabs.githubkmp

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Toast
import com.skylabs.Greeting
import com.skylabs.api.UpdateProblem
import com.skylabs.presentation.MembersPresenter
import com.skylabs.presentation.MembersView
import kotlinx.android.synthetic.main.activity_main.*

class MainActivity : AppCompatActivity(), MembersView {

    private val repository by lazy { (application as GitHubKMPApplication).dataRepository }
    private val presenter by lazy { MembersPresenter(this, repository = repository) }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        greeting.text = Greeting().greeting()

        presenter.onCreate()
    }

    override fun onDestroy() {
        super.onDestroy()
        presenter.onDestroy()
    }

    override var isUpdating = false

    override fun onUpdate(members: String) {
        runOnUiThread{
            Toast.makeText(this, members, Toast.LENGTH_SHORT).show()
        }
    }

    override fun showError(error: Throwable) {
        val errorMessage = when (error) {
            is UpdateProblem -> "Failed to get data from server, please check your internet connection"
            else -> "Unknown error"
        }
        runOnUiThread{
            Toast.makeText(this, errorMessage, Toast.LENGTH_SHORT).show()
        }
    }
}
