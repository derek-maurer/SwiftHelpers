SwiftHelpers
============

This is a small file that adds onto Swift. It fixes some small annoyances about Swift and adds some convenience as well. 


Dispatch
============

wait(0.5) {

    //wait 0.5 seconds and then perform this closure

}

async {

    //this closure will be executed in the background

}

main {

    //this closure will be performed on the main thread

}

// You can do something like this:

async {

    //something long in the background 

    main {

        //update the UI on the main thread

    }
}

Localization
============

let localizedString = local("KEY")

Control Flow
============

loop(3) {

    //perform something 3 times

}

Array
============

someArray.loop {
    //this closure will be performed for every element in the array
}

if someArray.contains(object: someObject) {
    //contains object is not implemented on Swift arrays
}

let index = someArray.indexOfObject(object: someObject)
//this is also not implemented on Swift arrays

Dictionary
============

someDictionary.writeToFile(file: "some/file/path", atomically: true)
//This is not implemented on Swift dictionaries