
import Foundation


class Helper: NSObject {

    static func getDocumentDirectory() -> String
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! String
        return documentsDirectory
    }
    
    static func fileExist(at path:String) -> Bool
    {
        let fileManager = FileManager.default
        return fileManager.fileExists(atPath: path)
    }
    
    
    static func readJsonFile(at path:String , ofType type:String) -> Data?
    {
        var data : Data?
        guard Bundle.main.path(forResource: path, ofType: type) != nil else {
            return nil
            
        }
        
        do {
            if let file = Bundle.main.url(forResource: path, withExtension: type) {
                data = try Data(contentsOf: file)
                
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                if let object = json as? [String: Any] {
                    // json is a dictionary
                    //  print(object)
                    print(object["courses"] as Any)
                } else if let object = json as? [Any] {
                    // json is an array
                    print(object)
                } else {
                    print("JSON is invalid")
                }
            } else {
                print("no file")
            }
        } catch {
            print(error.localizedDescription)
        }
        return data
    }

static func createDirectory(with folderName:String)
{
    do{
        try FileManager.default.createDirectory(atPath: getDocumentDirectory().appendingFormat(String(format: "%@",folderName)), withIntermediateDirectories: true, attributes: nil)
    } catch {
        Helper.debugLogs(with: "Error: \(error.localizedDescription)")
    }
}


  
    //MARK: - Print Logs
    static func debugLogs(with value:String = " ", file: String = #file,  methodName:String = #function ,  line: Int = #line ) {
        #if DEBUG
        NSLog("Pronounce %@ |\n %@ - %d : %@",methodName,file,line,value)
        #else
        #endif
    }
    
}
