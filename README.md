qrcode2scad
===========

Input a string to get a printable qrcode

Inspiration : http://imgur.com/a/vZEj7 by [aNt-e](http://www.reddit.com/r/3Dprinting/comments/1sys1z/combined_my_two_favorite_things/)

# Requirement

* Ruby
* OpenSCAD
* OpenJScad

# Install

```
cd qrcode2scad
bundle install
```

# Usage

```
cd qrcode2scad
ruby qrcode2scad.rb "Hello World"
```
*qrcode2.scad* and *qrcode.scad* are created, they can be used in OpenSCAD and OpenJScad to create a STL file, then use your favorite STL to gcode tool, and print it.

Process in OpenSCAD can be long, it took 17 minute to compile *qrcode.scad* file on a laptop.
