package com.example.quizigti;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

import org.w3c.dom.Text;

public class ResultActivity extends AppCompatActivity {

    private TextView textViewResult;
    private Button buttonRestart;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(R.style.Theme_QuizIGTI);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_result);

        Intent intent = getIntent();
        int result = intent.getIntExtra(MainActivity.RESULT_EXTRA, 0);

        textViewResult = (TextView)findViewById(R.id.textViewResult);
        textViewResult.setText("" + result + "% de acertos");
        buttonRestart = (Button)findViewById(R.id.buttonRestart);

        buttonRestart.setOnClickListener((view)->{
            Intent newIntent = new Intent(this, MainActivity.class);
            newIntent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TASK);
            startActivity(newIntent);
        });
    }
}