package com.example.quizigti.model;

import java.util.ArrayList;
import java.util.List;

public class Question {

    private String question;
    private boolean isTrue;

    public Question(String question, boolean isTrue) {
        this.question = question;
        this.isTrue = isTrue;
    }

    public String getQuestion() {
        return question;
    }

    public boolean isTrue() {
        return isTrue;
    }


    public static List<Question> getAllQuestions(){
        List<Question> questions = new ArrayList<>();

        questions.add(new Question("A linguagem oficial para desenvolvimento Android Nativo pela Google é a Kotlin.", true));
        questions.add(new Question("O processo de publicação do aplicativo na Google Play é gratuito.", false));
        questions.add(new Question("O Brasil possui uma população de quase 210 milhões.", true));
        questions.add(new Question("Flutter é uma dos frameworks de desenvolvimento mobile.", true));
        questions.add(new Question("A linguagem de programação do Flutter é o Dart.", true));
        questions.add(new Question("O Flutter possui interoperabilidade e pode ter projetos em Java e Dart.", false));
        questions.add(new Question("React-Native é uma plataforma para desenvolvimento de aplicativos móveis.", true));
        questions.add(new Question("O Kotlin possui interoperabilidade oque possibilita implementar projetos em Java e Kotlin.", true));

        return questions;
    }
}
