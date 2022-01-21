import Foundation

let urlString = "https://jsonplaceholder.typicode.com/comments?postId=1"
let url = URL(string: urlString)!

print("absoluteString")
print(url.absoluteString)
print("")

print("absoluteURL")
print(url.absoluteURL)
print("")

print("baseURL")
print(url.baseURL)
print("")

print("fragment")
print(url.fragment)
print("")

print("host")
print(url.host)
print("")

print("lastPathComponent")
print(url.lastPathComponent)
print("")

print("path")
print(url.path)
print("")

print("pathComponents")
print(url.pathComponents)
print("")

print("pathExtension")
print(url.pathExtension)
print("")

print("port")
print(url.port)
print("")

print("query")
print(url.query)
print("")

print("relativePath")
print(url.relativePath)
print("")

print("relativeString")
print(url.relativeString)
print("")

print("relativeString")
print(url.relativeString)
print("")

print("scheme")
print(url.scheme)
print("")

print("standardized")
print(url.standardized)
print("")

print("standardizedFileURL")
print(url.standardizedFileURL)
print("")

print("user")
print(url.user)
print("")

print("password")
print(url.password)
print("")
