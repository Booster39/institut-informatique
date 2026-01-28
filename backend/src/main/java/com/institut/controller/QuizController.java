package com.institut.controller;

import com.institut.model.QuizQuestion;
import com.institut.repository.ExerciseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/quiz")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class QuizController {
    private final ExerciseRepository exerciseRepository;
    
    @GetMapping("/exercise/{exerciseId}")
    public ResponseEntity<List<QuizQuestion>> getQuizByExercise(@PathVariable Long exerciseId) {
        return exerciseRepository.findById(exerciseId)
            .map(exercise -> ResponseEntity.ok(exercise.getQuizQuestions()))
            .orElse(ResponseEntity.notFound().build());
    }
}
