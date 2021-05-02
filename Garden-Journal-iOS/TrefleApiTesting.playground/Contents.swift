import Foundation

let accessToken = "yeYcMV39-a51EI6PhMyXGHqIcB8qRSYJFZRG307gFoQ"
//var urlStr: String = "https://trefle.io/api/v1/plants?token=\(accessToken)&filter[edible_part]=roots,leaves"
var urlStr: String = "https://trefle.io/api/v1/plants/search?token=\(accessToken)&q=sunflower"
var url = URL(string: urlStr)

var request = URLRequest(url: url!)
//request.url = URL(string: url)
request.httpMethod = "GET"

let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
    print( "Response: \(response)")
    do {
        let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, AnyObject>
        print( "json: \(json)" )
    } catch {
        print("Error: \(error)")
    }
}


task.resume()
