require 'rubygems'
require 'rqrcode'

def generateQrcode(string)
  return RQRCode::QRCode.new(string)
end

def extrusionArray(qr, type)
  extrusion = []

  33.times do |column|
    33.times do |row|
      if qr.dark?(column, row)
        extrusion << case type
          when 'jscad' then "    translate([3, #{column+2}, #{row+2}], cube({size: [2, 1.01, 1.01]}))"
          when 'scad'  then "  translate([3, #{column+2}, #{row+2}]) cube(size = [2, 1.01, 1.01]);"
        end
      end
    end
  end

  return extrusion
end

def generateScadFile(extrusion)

  File.open("qrcode.scad", "w") do |f|
    f.puts "difference() {"
    f.puts "  cube(size = [4, 37, 37]);"
    f.puts extrusion.join("\n")
    f.puts "};"
  end

end

def generateJscadFile(extrusion)

  File.open("qrcode.jscad", "w") do |f|
    f.puts "function main() {"
    f.puts "  return difference("
    f.puts "    cube({size: [4, 37, 37]}),"
    f.puts extrusion.join(",\n")
    f.puts "  );"
    f.puts "}"
  end

end

if ARGV.length == 1
  qr = generateQrcode(ARGV[0])
  generateJscadFile(extrusionArray(qr, 'jscad'))
  generateScadFile(extrusionArray(qr, 'scad'))
else
  puts 'Please give a string to build qrcode scad. Example : ruby qrcode2scad.rb "Hello World!"'
end
