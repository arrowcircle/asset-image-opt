require "asset-image-opt/version"
require 'piet'

class AssetImageOpt
  EXTENSIONS = %w{png jpeg jpg}
  WORKING_DIR = "app/assets/images"

  attr_accessor :files, :initial_size, :optimized_size

  def initialize
    @files = AssetImageOpt.get_files
    @initial_size = get_files_size
  end

  def optimize
    if @files.empty?
      puts "No files to optimize"
    else
      puts "Optimizing images"
      @files.each do |file|
        optimize_file(file)
        print '.'
      end
      @optimized_size = get_files_size
      puts ""
    end
  end

  def self.get_files_for_ext(ext)
    Dir.glob("#{Dir.pwd}/#{WORKING_DIR}/**/*.#{ext}")
  end

  def self.get_files
    res = []
    EXTENSIONS.each do |ext|
      res += AssetImageOpt.get_files_for_ext(ext)
    end
    res
  end

  def optimize_file(file)
    Piet.optimize(file)
  end

  def get_files_size
    size = 0
    @files.each do |file|
      size += File.size(file)
    end
    size
  end
end
