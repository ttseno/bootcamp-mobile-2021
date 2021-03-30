package com.example.quizigti;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;

public class SplashScreenActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_splash_screen);

        redirectActivity();
    }

    private void redirectActivity(){
        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            Intent redirect = new Intent(this, MainActivity.class);
            startActivity(redirect);
        }, 1000);
    }

}