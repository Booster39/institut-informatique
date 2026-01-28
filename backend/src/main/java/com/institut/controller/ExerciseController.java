package com.institut.controller;

import com.institut.model.Exercise;
import com.institut.repository.ExerciseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/exercises")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class ExerciseController {
    private final ExerciseRepository exerciseRepository;
    
    @GetMapping
    public ResponseEntity<List<Exercise>> getAllExercises() {
        return ResponseEntity.ok(exerciseRepository.findAll());
    }
    
    @GetMapping("/course/{courseId}")
    public ResponseEntity<List<Exercise>> getExercisesByCourse(@PathVariable Long courseId) {
        return ResponseEntity.ok(exerciseRepository.findByCourseIdOrderByOrderIndexAsc(courseId));
    }
    
    @GetMapping("/lesson/{lessonId}")
    public ResponseEntity<List<Exercise>> getExercisesByLesson(@PathVariable Long lessonId) {
        return ResponseEntity.ok(exerciseRepository.findByLessonIdOrderByOrderIndexAsc(lessonId));
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<Exercise> getExerciseById(@PathVariable Long id) {
        return exerciseRepository.findById(id)
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }
    
    @PostMapping
    public ResponseEntity<Exercise> createExercise(@RequestBody Exercise exercise) {
        return ResponseEntity.status(HttpStatus.CREATED)
            .body(exerciseRepository.save(exercise));
    }
    
    @PutMapping("/{id}")
    public ResponseEntity<Exercise> updateExercise(@PathVariable Long id, @RequestBody Exercise exercise) {
        if (!exerciseRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        exercise.setId(id);
        return ResponseEntity.ok(exerciseRepository.save(exercise));
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteExercise(@PathVariable Long id) {
        exerciseRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
}
