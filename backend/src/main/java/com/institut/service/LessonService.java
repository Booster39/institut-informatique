package com.institut.service;

import com.institut.model.Lesson;
import com.institut.repository.LessonRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class LessonService {
    private final LessonRepository lessonRepository;
    
    public List<Lesson> getLessonsByCourseId(Long courseId) {
        // Utiliser la requête JPQL personnalisée avec JOIN FETCH pour charger la relation course
        // Cela permet à getCourseId() de fonctionner lors de la sérialisation JSON
        return lessonRepository.findByCourseIdOrderByOrderIndexAsc(courseId);
    }
    
    public Optional<Lesson> getLessonById(Long id) {
        return lessonRepository.findById(id);
    }
    
    public Lesson createLesson(Lesson lesson) {
        return lessonRepository.save(lesson);
    }
    
    public Lesson updateLesson(Long id, Lesson lessonDetails) {
        Lesson lesson = lessonRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Lesson not found"));
        
        lesson.setTitleFr(lessonDetails.getTitleFr());
        lesson.setTitleEn(lessonDetails.getTitleEn());
        lesson.setTitleAr(lessonDetails.getTitleAr());
        lesson.setContentFr(lessonDetails.getContentFr());
        lesson.setContentEn(lessonDetails.getContentEn());
        lesson.setContentAr(lessonDetails.getContentAr());
        lesson.setKeyPointsFr(lessonDetails.getKeyPointsFr());
        lesson.setKeyPointsEn(lessonDetails.getKeyPointsEn());
        lesson.setKeyPointsAr(lessonDetails.getKeyPointsAr());
        lesson.setAnalogiesFr(lessonDetails.getAnalogiesFr());
        lesson.setAnalogiesEn(lessonDetails.getAnalogiesEn());
        lesson.setAnalogiesAr(lessonDetails.getAnalogiesAr());
        lesson.setExamplesFr(lessonDetails.getExamplesFr());
        lesson.setExamplesEn(lessonDetails.getExamplesEn());
        lesson.setExamplesAr(lessonDetails.getExamplesAr());
        lesson.setOrderIndex(lessonDetails.getOrderIndex());
        lesson.setEstimatedDuration(lessonDetails.getEstimatedDuration());
        
        return lessonRepository.save(lesson);
    }
    
    public void deleteLesson(Long id) {
        lessonRepository.deleteById(id);
    }
}
