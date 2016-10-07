# We do this here as well in case pry was not started through IRB,
# but for example from rails console with pry being in the Gemfile
$LOAD_PATH.push(*Dir["#{ENV['HOME']}/.prygems/gems/*/lib"]).uniq!

# Further Pry configuration

PLUGINS = %w[
  pry-doc
  pry-byebug
  awesome_print
  readline
]
# pry-remote
# pry-stack_explorer
# pry-git

PLUGINS.each do |name|
  begin
    require name
  rescue LoadError
    puts "\e[31mFailed\e[0m loading '#{name}'"
    @load_error = true
  end
end

if @load_error
  puts "\e[2mInstall them with `gem` or add them in `bundler` (if needed)\e[0m"
end

# Sublime Text FTW
Pry.config.editor = "subl -w"

# My pry is polite
Pry.config.hooks.add_hook(:after_session, :say_bye) do
  puts "bye-bye"
end

# Prompt with ruby version
Pry.prompt = [
  proc { |obj, nest_level, pry| "[#{pry.input_array.size}] #{RUBY_ENGINE}-#{RUBY_VERSION} (#{obj})#{":#{nest_level}" if nest_level > 0}> " },
  proc { |obj, nest_level, pry| "[#{pry.input_array.size}] #{RUBY_ENGINE}-#{RUBY_VERSION} (#{obj})#{":#{nest_level}" if nest_level > 0}* " }
]
