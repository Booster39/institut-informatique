package com.institut.repository;

import com.institut.model.Exercise;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ExerciseRepository extends JpaRepository<Exercise, Long> {
    List<Exercise> findByCourseIdOrderByOrderIndexAsc(Long courseId);
    List<Exercise> findByLessonIdOrderByOrderIndexAsc(Long lessonId);
}
