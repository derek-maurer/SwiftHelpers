//
//  SwiftHelpers.swift
//
//  Created by Derek Maurer on 7/4/14.
//  Copyright (c) 2014 Moca Apps LLC. All rights reserved.
//

import Foundation

///////////////////////////////////////////
///////////////////////////////////////////
//   Dispatch
///////////////////////////////////////////
///////////////////////////////////////////

//Usage: wait(0.5) { //this will be executed after 0.5 seconds on the main thread }

func wait(time:Double, closure:()->()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(time * Double(NSEC_PER_SEC))),dispatch_get_main_queue(), closure)
}

//Usage: wait(0.5) { //this will be executed after 0.5 seconds on passed queue }

func wait(time:Double, queue:dispatch_queue_t, closure:()->()) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW,Int64(time * Double(NSEC_PER_SEC))),queue, closure)
}

//Usage: async({ //perform background task here }, { //this will be called when the task is done on the main thread })

func async(execution:() -> (), finished:() -> ()) {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), {
        execution()
        dispatch_async(dispatch_get_main_queue(), {
            finished()
        })
    })
}

//Usage: async(someExecutionQueue, { //perform background task here on the supplied queue })

func async(executionQueue: dispatch_queue_t, execution:() -> ()) {
    dispatch_async(executionQueue, {
        execution()
    })
}

//Usage: async(someExecutionQueue, { //perform background task here on the supplied queue }, { //this will be called when the task is done on the main thread })

func async(executionQueue: dispatch_queue_t, execution:() -> (), finished:() -> ()) {
    dispatch_async(executionQueue, {
        execution()
        dispatch_async(dispatch_get_main_queue(), {
            finished()
        })
    })
}

//Usage: async(someExecutionQueue, { //perform background task here on the supplied queue }, someFinishedQueue, { //this will be called when the task is done on supplied queue })

func async(executionQueue: dispatch_queue_t, execution:() -> (), finishedQueue: dispatch_queue_t, finished:() -> ()) {
    dispatch_async(executionQueue, {
        execution()
        dispatch_async(finishedQueue, {
            finished()
        })
    })
}

//Usage: main { //this block will be called on the main thread }

func main(execution:() -> ()) {
    dispatch_async(dispatch_get_main_queue(), {
        execution()
    })
}

///////////////////////////////////////////
///////////////////////////////////////////
//    Localization
///////////////////////////////////////////
///////////////////////////////////////////

//Usage: let someLocalizedString = local("KEY")

func local(key:String) -> String {
    return NSLocalizedString(key, comment:"")
}

///////////////////////////////////////////
///////////////////////////////////////////
//    Control flow
///////////////////////////////////////////
///////////////////////////////////////////

//Usage: loop(3) { //this is called 3 times }

func loop(times:Int, closure:() -> ()) {
    for var i = 0; i < times; i++ {
        closure()
    }
}

///////////////////////////////////////////
///////////////////////////////////////////
//    Array
///////////////////////////////////////////
///////////////////////////////////////////

extension Array {
    
    //Usage: someArray.loop { //this is called for every instance in the array }
    
    func loop(closure:() -> ()) {
        for var i = 0; i < self.count; i++ {
            closure()
        }
    }
    
    //Usage: someArray.loop { (index:Int) in
        //this is called for every instance in the array
    //}
    
    func loop(closure:(index:Int) -> ()) {
        for var i = 0; i < self.count; i++ {
            closure(index:i)
        }
    }
    
    //Usage: someArray.loop { (index:Int, object:YourObjectType) in
    //this is called for every instance in the array
    //}

    func loop(closure:(index:Int, object:T) -> ()) {
        for var i = 0; i < self.count; i++ {
            closure(index:i, object:self[i])
        }
    }
    
    //Usage: if someArray.contains(object: someObject) {}
    
    func contains(#object:AnyObject) -> Bool {
        return self.bridgeToObjectiveC().containsObject(object)
    }
    
    //Usage: Int i = someArray.indexOf(object: someObjet)
    
    func indexOf(#object:AnyObject) -> Int {
        return self.bridgeToObjectiveC().indexOfObject(object)
    }
    
}

///////////////////////////////////////////
///////////////////////////////////////////
//    Dictionary
///////////////////////////////////////////
///////////////////////////////////////////

extension Dictionary {
    func writeToFile(file:String, atomically: Bool) -> Bool {
        return self.bridgeToObjectiveC().writeToFile(file, atomically: atomically)
    }
}
