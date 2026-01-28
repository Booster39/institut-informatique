package com.institut.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Entity
@Table(name = "quiz_questions")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class QuizQuestion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "exercise_id")
    private Exercise exercise;
    
    @Column(nullable = false, columnDefinition = "TEXT")
    private String questionFr;
    
    @Column(nullable = false, columnDefinition = "TEXT")
    private String questionEn;
    
    @Column(nullable = false, columnDefinition = "TEXT")
    private String questionAr;
    
    @ElementCollection
    @CollectionTable(name = "quiz_options", joinColumns = @JoinColumn(name = "question_id"))
    @Column(name = "option_text")
    private List<String> optionsFr;
    
    @ElementCollection
    @CollectionTable(name = "quiz_options_en", joinColumns = @JoinColumn(name = "question_id"))
    @Column(name = "option_text")
    private List<String> optionsEn;
    
    @ElementCollection
    @CollectionTable(name = "quiz_options_ar", joinColumns = @JoinColumn(name = "question_id"))
    @Column(name = "option_text")
    private List<String> optionsAr;
    
    private Integer correctAnswerIndex;
    
    @Column(columnDefinition = "TEXT")
    private String explanationFr;
    
    @Column(columnDefinition = "TEXT")
    private String explanationEn;
    
    @Column(columnDefinition = "TEXT")
    private String explanationAr;
}
