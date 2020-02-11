package com.example.kotlinmppsample

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import com.example.kotlinmppsample.client.ApiClient
import kotlinx.android.synthetic.main.activity_main.*
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        mainText.text = createApplicationScreenMessage()

        // fetch
        val client = ApiClient()
        progress.visibility = View.VISIBLE
        client.about {
            CoroutineScope(Dispatchers.Main).launch {
                progress.visibility = View.GONE
                textView.text = it
            }
        }
    }
}
