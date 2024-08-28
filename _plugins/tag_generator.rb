Jekyll::Hooks.register :site, :post_write do |site|
    tags = site.tags.keys
    tags.each do |tag|
      tag_dir = File.join(site.source, 'tags', tag)
      Dir.mkdir(tag_dir) unless File.exists?(tag_dir)
      tag_page = File.join(tag_dir, 'index.html')
      
      File.open(tag_page, 'w') do |f|
        f.write("---\n")
        f.write("layout: tag\n")
        f.write("tag: #{tag}\n")
        f.write("---\n")
      end
    end
  end
  
