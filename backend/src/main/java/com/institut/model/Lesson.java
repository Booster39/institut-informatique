package com.institut.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.institut.util.TextUtils;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "lessons")
@Data
@NoArgsConstructor
@AllArgsConstructor
@lombok.Getter(onMethod = @__(@JsonIgnore))
@lombok.Setter
public class Lesson {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id", nullable = false, insertable = true, updatable = true)
    @JsonIgnore
    private Course course;
    
    // Champ pour l'API JSON - exposé via getter
    @JsonProperty("courseId")
    public Long getCourseId() {
        return course != null ? course.getId() : null;
    }
    
    @Column(nullable = false)
    private String titleFr;
    
    @Column(nullable = false)
    private String titleEn;
    
    @Column(nullable = false)
    private String titleAr;
    
    @Column(columnDefinition = "TEXT")
    private String contentFr;
    
    @Column(columnDefinition = "TEXT")
    private String contentEn;
    
    @Column(columnDefinition = "TEXT")
    private String contentAr;
    
    @Column(columnDefinition = "TEXT")
    private String keyPointsFr;
    
    @Column(columnDefinition = "TEXT")
    private String keyPointsEn;
    
    @Column(columnDefinition = "TEXT")
    private String keyPointsAr;
    
    @Column(columnDefinition = "TEXT")
    private String analogiesFr;
    
    @Column(columnDefinition = "TEXT")
    private String analogiesEn;
    
    @Column(columnDefinition = "TEXT")
    private String analogiesAr;
    
    @Column(columnDefinition = "TEXT")
    private String examplesFr;
    
    @Column(columnDefinition = "TEXT")
    private String examplesEn;
    
    @Column(columnDefinition = "TEXT")
    private String examplesAr;
    
    // Getters avec conversion des \n littéraux pour l'API JSON
    @JsonProperty("keyPointsFr")
    public String getKeyPointsFr() {
        return TextUtils.convertLiteralNewlines(keyPointsFr);
    }
    
    @JsonProperty("keyPointsEn")
    public String getKeyPointsEn() {
        return TextUtils.convertLiteralNewlines(keyPointsEn);
    }
    
    @JsonProperty("keyPointsAr")
    public String getKeyPointsAr() {
        return TextUtils.convertLiteralNewlines(keyPointsAr);
    }
    
    @JsonProperty("analogiesFr")
    public String getAnalogiesFr() {
        return TextUtils.convertLiteralNewlines(analogiesFr);
    }
    
    @JsonProperty("analogiesEn")
    public String getAnalogiesEn() {
        return TextUtils.convertLiteralNewlines(analogiesEn);
    }
    
    @JsonProperty("analogiesAr")
    public String getAnalogiesAr() {
        return TextUtils.convertLiteralNewlines(analogiesAr);
    }
    
    @JsonProperty("examplesFr")
    public String getExamplesFr() {
        return TextUtils.convertLiteralNewlines(examplesFr);
    }
    
    @JsonProperty("examplesEn")
    public String getExamplesEn() {
        return TextUtils.convertLiteralNewlines(examplesEn);
    }
    
    @JsonProperty("examplesAr")
    public String getExamplesAr() {
        return TextUtils.convertLiteralNewlines(examplesAr);
    }
    
    @JsonProperty("contentFr")
    public String getContentFr() {
        return TextUtils.convertLiteralNewlines(contentFr);
    }
    
    @JsonProperty("contentEn")
    public String getContentEn() {
        return TextUtils.convertLiteralNewlines(contentEn);
    }
    
    @JsonProperty("contentAr")
    public String getContentAr() {
        return TextUtils.convertLiteralNewlines(contentAr);
    }
    
    @OneToMany(mappedBy = "lesson", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private List<CodeBlock> codeBlocks;
    
    private Integer orderIndex;
    private Integer estimatedDuration; // en minutes
    
    private LocalDateTime createdAt;
    private LocalDateTime updatedAt;
    
    // Getters avec conversion des \n littéraux pour l'API JSON
    @JsonProperty("keyPointsFr")
    public String getKeyPointsFrJson() {
        return TextUtils.convertLiteralNewlines(keyPointsFr);
    }
    
    @JsonProperty("keyPointsEn")
    public String getKeyPointsEnJson() {
        return TextUtils.convertLiteralNewlines(keyPointsEn);
    }
    
    @JsonProperty("keyPointsAr")
    public String getKeyPointsArJson() {
        return TextUtils.convertLiteralNewlines(keyPointsAr);
    }
    
    @JsonProperty("analogiesFr")
    public String getAnalogiesFrJson() {
        return TextUtils.convertLiteralNewlines(analogiesFr);
    }
    
    @JsonProperty("analogiesEn")
    public String getAnalogiesEnJson() {
        return TextUtils.convertLiteralNewlines(analogiesEn);
    }
    
    @JsonProperty("analogiesAr")
    public String getAnalogiesArJson() {
        return TextUtils.convertLiteralNewlines(analogiesAr);
    }
    
    @JsonProperty("examplesFr")
    public String getExamplesFrJson() {
        return TextUtils.convertLiteralNewlines(examplesFr);
    }
    
    @JsonProperty("examplesEn")
    public String getExamplesEnJson() {
        return TextUtils.convertLiteralNewlines(examplesEn);
    }
    
    @JsonProperty("examplesAr")
    public String getExamplesArJson() {
        return TextUtils.convertLiteralNewlines(examplesAr);
    }
    
    @JsonProperty("contentFr")
    public String getContentFrJson() {
        return TextUtils.convertLiteralNewlines(contentFr);
    }
    
    @JsonProperty("contentEn")
    public String getContentEnJson() {
        return TextUtils.convertLiteralNewlines(contentEn);
    }
    
    @JsonProperty("contentAr")
    public String getContentArJson() {
        return TextUtils.convertLiteralNewlines(contentAr);
    }
    
    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }
    
    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
