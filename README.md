SwiftHelpers
============

This is a small file that adds onto Swift. It fixes some small annoyances about Swift and adds some convenience as well. 


Dispatch
============
<code>
wait(0.5) {
<br />
    //wait 0.5 seconds and then perform this closure
<br />
}
</code>

<code>
async {
    //this closure will be executed in the background
}
</code>

<code>
main {
    //this closure will be performed on the main thread
}

You can use it like this:

<code>
async {
    //something long in the background 

    main {
        //update the UI on the main thread
    }
}
</code>

Localization
============

<code>
let localizedString = local("KEY")
</code>

Control Flow
============

<code>
loop(3) {
    //perform something 3 times
}
</code>

Array
============

<code>
someArray.loop {
    //this closure will be performed for every element in the array
}
</code>

<code>
if someArray.contains(object: someObject) {
    //contains object is not implemented on Swift arrays
}
</code>

<code>
let index = someArray.indexOfObject(object: someObject)
//this is also not implemented on Swift arrays
</code>

Dictionary
============

<code>
someDictionary.writeToFile(file: "some/file/path", atomically: true)<br/>
//This is not implemented on Swift dictionaries
</code>