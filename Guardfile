guard :shell do
  watch("test.rb") {|m| `ruby test.rb` }
end

guard 'livereload' do
  watch(%r{public/.+\.(css|js|html)})
end
