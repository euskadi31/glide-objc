Glide [![CocoaPods](https://img.shields.io/cocoapods/v/Glide.svg)](https://cocoapods.org/pods/Glide)
=====

| Branch  | Status | Coverage |
|---------|--------|----------|
| master  | [![Build Status](https://travis-ci.org/euskadi31/glide-objc.svg?branch=master)](https://travis-ci.org/euskadi31/glide-objc) | [![Coverage Status](https://coveralls.io/repos/github/euskadi31/glide-objc/badge.svg?branch=master)](https://coveralls.io/github/euskadi31/glide-objc?branch=master)    |
| develop | [![Build Status](https://travis-ci.org/euskadi31/glide-objc.svg?branch=develop)](https://travis-ci.org/euskadi31/glide-objc) | [![Coverage Status](https://coveralls.io/repos/github/euskadi31/glide-objc/badge.svg?branch=develop)](https://coveralls.io/github/euskadi31/glide-objc?branch=develop) |


[http://glide.thephpleague.com/](Glide) client for iOS & Mac OS X

## Install

You want to add `pod 'Glide', '~> 1.0'` similar to the following to your Podfile:

~~~ruby
target 'MyApp' do
    pod 'Glide', '~> 1.0'
end
~~~

Then run a `pod install` inside your terminal, or from CocoaPods.app.

## Get started

~~~objc
#import <Glide/Glide.h>

GlideClient *glide = [[GlideClient alloc] initWithBase:@"https:images.domain.tld"];

[glide setWidth:200 andHeight:200];

NSLog(@"Url: %@", [glide absoluteString]);
~~~


## License

Glide-objc is licensed under [the MIT license](LICENSE.md).
