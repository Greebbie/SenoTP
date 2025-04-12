// SampleDataService.swift
// SenoTP
//
// Created by midori on 4/11/25.
//

import Foundation
import SwiftData

class SampleDataService {
    
    static func addSampleData(to modelContext: ModelContext) {
        // Add language subjects
        let japaneseSubject = createJapaneseSubject()
        modelContext.insert(japaneseSubject)
        
        // Add math subjects
        let mathSubject = createMathSubject()
        modelContext.insert(mathSubject)
        
        // Add programming subjects
        let programmingSubject = createProgrammingSubject()
        modelContext.insert(programmingSubject)
        
        // Initialize user progress
        let userProgress = UserProgress(userID: "default_user")
        
        // Add subject progress for each subject
        let japaneseProgress = SubjectProgress(
            subjectID: japaneseSubject.id.uuidString,
            subjectName: japaneseSubject.name
        )
        let mathProgress = SubjectProgress(
            subjectID: mathSubject.id.uuidString,
            subjectName: mathSubject.name
        )
        let programmingProgress = SubjectProgress(
            subjectID: programmingSubject.id.uuidString,
            subjectName: programmingSubject.name
        )
        
        userProgress.subjectProgress = [japaneseProgress, mathProgress, programmingProgress]
        modelContext.insert(userProgress)
    }
    
    // Create a basic math subject
    private static func createMathSubject() -> Subject {
        let mathSubject = Subject(
            name: "Mathematics",
            category: .mathematics,
            subjectDescription: "Learn various mathematics topics from basic arithmetic to advanced calculus."
        )
        
        let algebraModule = LearningModule(
            name: "Basic Algebra",
            type: .flashcards,
            moduleDescription: "Learn fundamental algebraic concepts",
            difficulty: 2,
            estimatedDuration: 45
        )
        
        let geometryModule = LearningModule(
            name: "Geometry Fundamentals",
            type: .quiz,
            moduleDescription: "Basic geometry shapes and theorems",
            difficulty: 2,
            estimatedDuration: 30
        )
        
        mathSubject.modules = [algebraModule, geometryModule]
        
        return mathSubject
    }
    
    // Create a basic programming subject
    private static func createProgrammingSubject() -> Subject {
        let programmingSubject = Subject(
            name: "Swift Programming",
            category: .programming,
            subjectDescription: "Learn Swift programming for iOS, macOS, and more."
        )
        
        let swiftBasicsModule = LearningModule(
            name: "Swift Basics",
            type: .reading,
            moduleDescription: "Introduction to Swift syntax and concepts",
            difficulty: 2,
            estimatedDuration: 60
        )
        
        let swiftUIModule = LearningModule(
            name: "SwiftUI Essentials",
            type: .interactive,
            moduleDescription: "Learn the fundamentals of SwiftUI",
            difficulty: 3,
            estimatedDuration: 90
        )
        
        programmingSubject.modules = [swiftBasicsModule, swiftUIModule]
        
        return programmingSubject
    }
}
