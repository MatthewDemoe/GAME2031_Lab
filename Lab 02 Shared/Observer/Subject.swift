//
//  Subject.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-10.
//

class Subject {
    var observers: [Observer] = []
    
    func addObserver(_ observer: Observer){
        observers.append(observer)
    }
    
    func removeObserver(_ observer: Observer){
        if let index = observers.firstIndex(where: {$0 === observer}){
            observers.remove(at: index)
        }
    }
    
    func notifyObservers(_ context: Context){
        observers.forEach({$0.update(context)})
    }
}

