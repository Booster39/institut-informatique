package com.institut.repository;

import com.institut.model.Lesson;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LessonRepository extends JpaRepository<Lesson, Long> {
    // Utiliser une requête JPQL avec JOIN FETCH pour charger la relation course
    // Cela permet à getCourseId() de fonctionner lors de la sérialisation JSON
    @Query("SELECT l FROM Lesson l JOIN FETCH l.course WHERE l.course.id = :courseId ORDER BY l.orderIndex ASC")
    List<Lesson> findByCourseIdOrderByOrderIndexAsc(@Param("courseId") Long courseId);
}
