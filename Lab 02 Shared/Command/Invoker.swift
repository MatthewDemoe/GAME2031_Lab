//
//  Invoker.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-13.
//

class Invoker {
    private var myCommand: Command?
    
    init(){}
    
    func setCommand(_ command: Command){
        myCommand = command
    }
    
    func invokeCommand(){
        myCommand?.execute()
    }
    
    func undoCommand(){
        myCommand?.undo()
    }
}
