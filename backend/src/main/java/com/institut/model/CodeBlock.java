package com.institut.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Entity
@Table(name = "code_blocks")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class CodeBlock {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "lesson_id")
    private Lesson lesson;
    
    @Column(nullable = false, columnDefinition = "TEXT")
    private String code;
    
    @Column(nullable = false)
    private String language; // java, typescript, sql, etc.
    
    @Column(columnDefinition = "TEXT")
    private String descriptionFr;
    
    @Column(columnDefinition = "TEXT")
    private String descriptionEn;
    
    @Column(columnDefinition = "TEXT")
    private String descriptionAr;
    
    private Boolean isEditable;
    private Boolean isRunnable;
    
    private Integer orderIndex;
}
