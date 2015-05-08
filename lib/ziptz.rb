require 'yaml'

class Ziptz
  def initialize
    @zips = {}

    File.foreach(data_path) do |line|
      zip, tz = line.split('=')
      @zips[zip.strip] = tz.strip
    end
  end

  def time_zone(zip)
    @zips[zip.to_s]
  end

  def zips(tz)
    selected = @zips.select {|_, v| v == tz.to_s}
    selected.keys.sort
  end

  protected

  def data_path
    File.join(File.dirname(__FILE__), '..', 'ziptz.data')
  end
end
