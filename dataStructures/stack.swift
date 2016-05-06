/**
 This is the same as the version provided in the Swift book
 
 - Note: we don't have to call the generic T, we can give it any name that is meaningful to describe the type later. Here we've chosen "Element".
 
 When we create a stack instance, we put the actual type in angle brackets:
 ```Swift
 var stackOfStrings = Stack<String>()
 ```

 */
struct Stack<Element> {
    
    var items = [Element]()
    
    mutating func push(item: Element) {
        items.append(item)
    }
    
    mutating func pop() -> Element {
        return items.removeLast()
    }
    
}
