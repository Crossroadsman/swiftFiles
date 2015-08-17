There are several classes that help us to work with files. At the heart of everything is a class called NSFileManager.

We get an NSFileManager object by instantiating an object with a name:

let fileManager = NSFileManager()

Here it is used in a scenario:


let fileManager = NSFileManager()

let simplePath = "/Users/finnthehuman/Desktop/enchiridion.txt"

//check if file exists
if (fileManager.fileExistsAtPath(simplePath)) {
    print("file exists!")

} else {
    print ("uh oh, no file!")
}


//get file attributes 
let fileAttributes: NSDictionary = fileManager.attributesOfItemAtPath(path: simplePath, error:nil)


// the above was a guess. It might be:
// fileManager.attributesOfItem(path: simplePath, error: nil)

// Codesense will probably help identify it.

for key in fileAttributes {
    print("The attribute key is \(key) and the value is \(fileAttributes[key])")
}


// get a user's home directory (simple)
let homeDirectory = NSHomeDirectory()
print("Calling NSHomeDirectory() results in: \(homeDirectory)")

// get a user's documents directory (powerful)
let docsDirectory : NSURL = fileManager.URLForDirector(directory: NSDocumentDirectory, inDomain: NSUserDomainMask, appropriateForURL: nil, create: false, error, nil)
print("The fileManager method returned \(docsDirectory)")


/*
https://developer.apple.com/library/ios/documentation/Swift/Conceptual/BuildingCocoaApps/InteractingWithObjective-CAPIs.html
To instantiate an Objective-C class in Swift, you call one of its initializers with Swift syntax.
When OC init methods come over to Swift, they take on native Swift initializer syntax:
- the "init" prefix gets sliced off and becomes a keyword to indicate that the method is an initializer.
 (for init methods that begin with "initWith", the "With" also gets sliced off)
- the first letter of the selector piece that had "init" or "initWith" split off from it becomes lowercase
- that selector piece is treated as the name of the first argument.
- the rest of the selector pieces also correspond to argument names.
- Each selector piece goes inside the parens and is required at the call site.

Example:

OC:

UITableView *myTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];

Swift:

let myTableView : UITableView = UITableView(frame:CGRectZero, style:.Grouped) //could omit the typing and let type inference determine the type.

*/
