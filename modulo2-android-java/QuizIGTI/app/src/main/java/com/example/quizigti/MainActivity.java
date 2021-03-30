package com.example.quizigti;

import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;
import android.widget.TextView;

import com.example.quizigti.model.Question;
import com.example.quizigti.model.Quiz;

import java.util.List;

public class MainActivity extends AppCompatActivity {

    public static final String RESULT_EXTRA = "java.com.example.quizigti.result";

    private Quiz quiz;
    private TextView textViewQuestion;
    private Button buttonTrue;
    private Button buttonFalse;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        setTheme(R.style.Theme_QuizIGTI);
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        textViewQuestion = (TextView)findViewById(R.id.txtViewQuestion);
        buttonTrue = (Button)findViewById(R.id.buttonTrue);
        buttonFalse = (Button)findViewById(R.id.buttonFalse);

        quiz = new Quiz();
        setViewQuestion();

        buttonTrue.setOnClickListener((view) -> {
            computeAnswer(true);
        });
        buttonFalse.setOnClickListener((view) -> {
            computeAnswer(false);
        });
    }

    private void computeAnswer(boolean answer){
        Question question = quiz.getQuestions().get(0);
        if (question.isTrue() == answer) {
            quiz.setRightAnswers(quiz.getRightAnswers() + 1);
        }
        List<Question> questions = quiz.getQuestions();
        if (questions.size() > 1){
            questions.remove(0);
            setViewQuestion();
        } else {
            Intent resultView = new Intent(this, ResultActivity.class);
            resultView.putExtra(RESULT_EXTRA, quiz.getScore());
            startActivity(resultView);
        }

    }

    private void setViewQuestion(){
        Question first_question = quiz.getQuestions().get(0);
        textViewQuestion.setText(first_question.getQuestion());
    }

}