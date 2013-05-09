require "asset-image-opt/version"
require 'image_optim'
require 'thread'

class AssetImageOpt
  EXTENSIONS = %w{png jpeg jpg gif}
  WORKING_DIR = "app/assets/images"

  attr_accessor :files, :initial_size, :optimized_size

  def initialize
    @files = AssetImageOpt.get_files
    @initial_size = get_files_size
    @optimizer = ImageOptim.new(:pngout => false)
  end

  def threads_count
    case RbConfig::CONFIG['host_os']
    when /darwin9/
      `hwprefs cpu_count`.to_i
    when /darwin/
      ((`which hwprefs` != '') ? `hwprefs thread_count` : `sysctl -n hw.ncpu`).to_i
    when /linux/
      `cat /proc/cpuinfo | grep processor | wc -l`.to_i
    when /freebsd/
      `sysctl -n hw.ncpu`.to_i
    when /mswin|mingw/
      require 'win32ole'
      wmi = WIN32OLE.connect("winmgmts://")
      cpu = wmi.ExecQuery("select NumberOfCores from Win32_Processor") # TODO count hyper-threaded in this
      cpu.to_enum.first.NumberOfCores
    end
  end

  def optimize_files
    queue = Queue.new
    @files.each{|e| queue << e }

    threads = []
    threads_count.times do
      threads << Thread.new do
        while (e = queue.pop(true) rescue nil)
          optimize_file(e)
        end
      end
    end

    threads.each {|t| t.join }
    puts ""
    @optimized_size = get_files_size
  end

  def optimize
    if @files.empty?
      puts "No files to optimize"
    else
      puts "Optimizing images"
      optimize_files
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
    @optimizer.optimize_image!(file)
    print '.'
  end

  def get_files_size
    size = 0
    @files.each do |file|
      size += File.size(file)
    end
    size
  end
end
