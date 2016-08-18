

# NRConnection

[![Version](https://img.shields.io/cocoapods/v/NRConnection.svg?style=flat)](http://cocoapods.org/pods/NRConnection)
[![License](https://img.shields.io/cocoapods/l/NRConnection.svg?style=flat)](http://cocoapods.org/pods/NRConnection)
[![Platform](https://img.shields.io/cocoapods/p/NRConnection.svg?style=flat)](http://cocoapods.org/pods/NRConnection)


## Introduction

NRConnection: lets use the network layer in the simplest way. Send/Get parameters,images and videos from/to server in a simplest way. Well there are various network classes available for open source, but most of them missing the simplicity . NRConnection allow developers to post parameters, images and videos in a simplest way. Just a single method for video and images which needs the array of images and videos and NRConnection sends it to the server in a most elegant way with the use of Alamofire. You can get the success/failure with the help of NRCompletionHandler.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
Xcode 7+ , Swift 2 , iOS 9 and above

## Installation

NRConnection is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "NRConnection"
```

## Usage
# GET web service

```
BASE_URL = "https://jsonplaceholder.typicode.com/" // change baseurl with your server url.

NRConnection.callServiceWithName(.GET, serviceName: "posts", parameters: [:]) { (response, result) in
if response.successful() { // do your work with result if response is successful
}
}

```
# POST web service (by default, mean if you skip method parameter it should consider as a post)

```
BASE_URL = "" // change baseurl with your server url.
let params = ["userId": "5", "userName": "Naveen Rana"]
NRConnection.callServiceWithName(.POST, serviceName: "posts", parameters: params) { (response, result) in
if response.successful() { // do your work with result if response is successful
}
}

```
# Send Images
```
func sendImages() {
let imagesArray = [UIImage(named: "test1")!,UIImage(named: "test2")!]
let params = ["userId": "5", "userName": "Naveen Rana"]

NRConnection.callServiceWithImagesVideosArray(imagesArray: imagesArray, parameters: params, serviceName: "PostImages") { (response, result) in
if response.successful() {
print("images post successfully")
}
}
}


```
# Send Videos
```
func sendVideos() {
let videosArray = [NSData(contentsOfURL: NSURL(string: "videoUrl")!)!]
let params = ["userId": "5", "userName": "Naveen Rana"]

NRConnection.callServiceWithImagesVideosArray(videoArray: videosArray, parameters: params, serviceName: "PostImages") { (response, result) in
if response.successful() {
print("images post successfully")
}
}
}



```
# Only Url hit
```
func onlyUrl() {

NRConnection.callServiceWithURL(NSURL(string: "https://github.com/naveenrana1309/NRConnection")!) { (response, result) in
if response.successful() {
print("url hit successfully")
}

}
}



```
## Release Notes

1) BASE_URL , you have to change this url with your server url , this parameter is public variable so you can change this in your configuration file.
2) Please check your encoding if its not working , please be sure your backend developer use same encoding.
3) You can change the encoding parameter according to your requirement also.



## Contributing

Contributions are always welcome! (:

1. Fork it ( http://github.com/naveenrana1309/NRConnection/fork )
2. Create your feature branch ('git checkout -b my-new-feature')
3. Commit your changes ('git commit -am 'Add some feature')
4. Push to the branch ('git push origin my-new-feature')
5. Create new Pull Request

## Compatibility

Xcode 7+ , Swift 2 , iOS 9 and above

## Author

Naveen Rana. [See Profile](https://www.linkedin.com/in/naveen-rana-9a371a40)

Email: 
naveenrana1309@gmail.com. 

Check out [Facebook Page](https://www.facebook.com/iOSByHeart/) for detail.

## License

NRConnection is available under the MIT license. See the LICENSE file for more info.
