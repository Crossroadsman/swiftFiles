// linked list

/**
This describes the structure of the list itself.
It has a single (optional) property, the *head*, which is a link to the first element in the list.
Currently has a single function: *append*, which adds a new list element
Need to add *delete*, *insert*, *printAll*, etc
*/
class LinkedList {
    
    var head: ListElement?
        
    func append(element: ListElement) {
        
        func append(element: ListElement, current: ListElement) {
            
            guard current.next != nil else {
                current.next = element
                return
            }
            
            append(element, current: current.next)
            
        }
        
        
        guard head != nil else {
            head = element
            return
        }
        
        append(element, current: head)
        
        
    }
    
}

/**
This describes the list element. 
It has two properties: *next* : a link to the next element in the list, and *underlying* : the actual underlying data in the list.
Both properties are defined as optionals
*/
struct ListElement<Underlying> {
    
    var next: ListElement?
    
    var underlying: Underlying?
    
}
