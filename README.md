# Asset-Image-Opt

Local assets optimizer for Rails apps. It will use lossless compression on every jpeg/jpg and png files in app/assets/images directory and subdirecotires.

Compression efficiency is 5-15% for free and without quality loss.

## Installation

This gem requires image processing utilities

### Debian/Ubuntu

	sudo apt-get install -y advancecomp gifsicle jpegoptim libjpeg-progs optipng pngcrush

### OSX

	brew install advancecomp gifsicle jpegoptim jpeg optipng pngcrush

### Rails

Add this line to your application's Gemfile:

    gem 'asset-image-opt'

And then execute:

    $ bundle

## Usage
Execute:

    bundle exec optimize_images

It will optimize all images in app/assets/images and subdirs.

## TODO
* Check if **optipng** and **jpegoptim** is present in the system, show instructions otherwise
* Remove test_images from rspec and gem source

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
