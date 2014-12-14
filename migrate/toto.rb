# Run from jekyll dir
Dir['/Users/conroy/blawg-toto/articles/*.txt'].sort.each do |path|
  file = File.basename(path)
  new_file = "_posts/#{file.sub(/\.txt\z/, '.md')}"
  text = File.read(path)
  headers, md = text.split("\n\n", 2)
  raise "No title" unless headers =~ /^title: (.+)$/
  title = $1
  File.open(new_file, "w+") do |f|
    f.write"---\nlayout: post\ntags:\n - blawg\ntitle: #{title}\n---\n\n#{md}"
  end
end

