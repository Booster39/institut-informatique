package com.institut.service;

import com.institut.model.Course;
import com.institut.repository.CourseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
@Transactional
public class CourseService {
    private final CourseRepository courseRepository;
    
    public List<Course> getAllCourses() {
        return courseRepository.findAllByOrderByOrderIndexAsc();
    }
    
    public Optional<Course> getCourseById(Long id) {
        return courseRepository.findById(id);
    }
    
    public Course createCourse(Course course) {
        return courseRepository.save(course);
    }
    
    public Course updateCourse(Long id, Course courseDetails) {
        Course course = courseRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Course not found"));
        
        course.setTitleFr(courseDetails.getTitleFr());
        course.setTitleEn(courseDetails.getTitleEn());
        course.setTitleAr(courseDetails.getTitleAr());
        course.setDescriptionFr(courseDetails.getDescriptionFr());
        course.setDescriptionEn(courseDetails.getDescriptionEn());
        course.setDescriptionAr(courseDetails.getDescriptionAr());
        course.setLevel(courseDetails.getLevel());
        course.setOrderIndex(courseDetails.getOrderIndex());
        
        return courseRepository.save(course);
    }
    
    public void deleteCourse(Long id) {
        courseRepository.deleteById(id);
    }
}
