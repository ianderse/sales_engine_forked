guard :minitest do
  watch(%r{^test/.*_test\.rb$})
  watch(%r{^lib/(.*)\.rb}) do |fragments|
    puts "got #{fragments[1]}"
    "test/#{fragments[1]}_test.rb"
  end
end
