require 'rubygems'

# This makes pry itself and all pry gems available
# $LOAD_PATH.push(*Dir["#{ENV['HOME']}/.prygems/gems/*/lib"]).uniq!

begin
  require "pry"
  Pry.start
  exit
rescue LoadError => e
  warn "=> Unable to load pry"
end

if defined? Pry

  Pry.start
  exit

else

  # Do your normal IRB stuff in case Pry is not available

end
