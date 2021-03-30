package com.example.quizigti.model;

import java.util.ArrayList;
import java.util.List;

public class Quiz {

    private List<Question> questions;
    private int total_questions;
    private int rightAnswers;

    public Quiz() {
        this.questions = Question.getAllQuestions();
        this.total_questions = this.questions.size();
        this.rightAnswers = 0;
    }

    public List<Question> getQuestions() {
        return questions;
    }

    public void setQuestions(List<Question> questions) {
        this.questions = questions;
    }

    public int getRightAnswers() {
        return rightAnswers;
    }

    public void setRightAnswers(int rightAnswers) {
        this.rightAnswers = rightAnswers;
    }

    public int getScore(){
        return (this.rightAnswers * 100)/this.total_questions;
    }
}
