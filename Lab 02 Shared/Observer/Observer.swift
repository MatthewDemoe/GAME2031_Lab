//
//  Observer.swift
//  Lab 02 iOS
//
//  Created by Kaela  Murphy  on 2025-01-10.
//

protocol Observer : AnyObject{
    func update(_ context: any Context)
}
