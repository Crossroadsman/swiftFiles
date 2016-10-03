import Foundation

// Need to handle commas in data
// (properly formatted csv escapes:
// - commas
// - line breaks
// - double quotes
// with double quotes)
// WARNING: will probably crash if any rows are longer than title row
/**
 Instructions:
 -------------
 create a CSVParser object
 pass the CSV to be parsed as a string to .input
 specify whether there is a title row (default = true) using .hasTitleRow
 */
class CSVParser {
    
    // For Making Types Clearer
    typealias CSVTitles = [String]
    typealias CSVData = [[String:String]]
    
    
    // Data
    private var _titles: CSVTitles = []
    private var _data: CSVData = []
    private var _input: String = ""
    private var _hasTitleRow: Bool = true
    
    var titles: CSVTitles {
        return _titles
    }
    
    var data: CSVData {
        return _data
    }
    
    var input: String {
        get {
            return _input
        }
        set (updatedInput) {
            _input = updatedInput
        }
    }
    
    var hasTitleRow: Bool {
        get {
            return _hasTitleRow
        }
        set {
            _hasTitleRow = newValue
        }
    }
    
    
    func parseStateless(source: String) -> (CSVTitles, CSVData) {
        
        var columnTitles: CSVTitles = []
        var workingData: CSVData = []
        
        let cleanedSource = cleanData(source: source)
        var rows = cleanedSource.components(separatedBy: "\n")
        
        guard rows.count > 0 else {
            print("Parser determined no data in file")
            return (columnTitles, workingData)
        }
        
        if hasTitleRow {
            columnTitles = getFieldsFor(row: rows.first!, withDelimiter: ",")
            rows.removeFirst()
        } else {
            columnTitles = getFieldsFor(row: rows.first!, withDelimiter: ",")
            for i in stride(from: 0, to: columnTitles.count, by: 1) {
                columnTitles[i] = "column_\(i)"
            }
        }
        
        if rows.last == "" {
            rows.removeLast()
        }
        
        rows.forEach {
            
            let cells = getFieldsFor(row: $0, withDelimiter: ",")
            var rowOfCells = [String: String]()
            
            for (key, value) in cells.enumerated() {
                let cellName = columnTitles[key]
                rowOfCells[cellName] = value
            }
            workingData.append(rowOfCells)
           
        }
        
        return (columnTitles, workingData)
 
    }
    
    // with state
    func parse() {
        
        var columnTitles: CSVTitles = []
        var workingData: CSVData = []
        
        let cleanedSource = cleanData(source: input)
        var rows = cleanedSource.components(separatedBy: "\n")
        
        guard rows.count > 0 else {
            print("Parser determined no data in file")
            return
        }
        
        if hasTitleRow {
            columnTitles = getFieldsFor(row: rows.first!, withDelimiter: ",")
            rows.removeFirst()
        } else {
            columnTitles = getFieldsFor(row: rows.first!, withDelimiter: ",")
            for i in stride(from: 0, to: columnTitles.count, by: 1) {
                columnTitles[i] = "column_\(i)"
            }
        }
        
        if rows.last == "" {
            rows.removeLast()
        }
        
        rows.forEach {
            
            let cells = getFieldsFor(row: $0, withDelimiter: ",")
            var rowOfCells = [String: String]()
            
            for (key, value) in cells.enumerated() {
                let cellName = columnTitles[key]
                rowOfCells[cellName] = value
            }
            workingData.append(rowOfCells)
            
        }
        
        (_titles, _data) = (columnTitles, workingData)
        
    }

    /**
     convert carriage returns to newlines
     eliminate blank lines (double sequences of \n)
     (how does this handle \n\n\n?)
    */
    //TODO: Figure out how this handles \n\n\n
    func cleanData(source: String) -> String {
        
        var workingData = source
        workingData = workingData.replacingOccurrences(of: "\r", with: "\n")
        workingData = workingData.replacingOccurrences(of: "\n\n", with: "\n")
        return workingData
    }
    
    func getFieldsFor(row: String, withDelimiter delimiter: String) -> CSVTitles {
        
        return row.components(separatedBy: delimiter)
    }
    
    
}


// Example Code:

let testFile = "Artist,Name\n\rJonathan Coulton,Skullcrusher Mountain\nJonathan Coulton,The Future Soon\n"

let parser = CSVParser()
parser.input = testFile
parser.hasTitleRow = true // true is default
parser.parse() // updates data with values parsed
parser.data // the parsed values

// stateless version with no side effects:
let (_, data) = parser.parseStateless(source: "t1,t2\nv1,v2")
print(data)
