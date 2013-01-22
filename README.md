# Asset-Image-Opt

Local assets optimizer for Rails apps

## Installation

This gem requires two image optimization utilities: **optipng** and
**jpegoptim**.
You can install them by following the instructions on each authors'
page:

* Installation for [optipng](http://optipng.sourceforge.net/)
* Installation for [jpegoptim](http://freecode.com/projects/jpegoptim)

Add this line to your application's Gemfile:

    gem 'asset-image-opt'

And then execute:

    $ bundle

## Usage
Execute:

    bundle exec optimize_images
    
It will optimize all images in app/assets/images 

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
