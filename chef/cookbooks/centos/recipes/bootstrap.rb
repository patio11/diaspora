execute "bundler deps" do
  command "yum install -y cpio"
end
execute "nokogiri deps" do
  command "yum install -y libxml2-devel libxslt-devel"
end
execute "eventmachine deps" do
  command "yum install -y gcc-c++"
end

def harden_ruby(ruby_string)
  Dir.glob("/usr/local/rvm/wrappers/#{ruby_string}/*").each do |file|
    link "/usr/local/bin/#{file.split('/').last}" do
      to file
    end
  end
  Dir.glob("/usr/local/rvm/gems/#{ruby_string}/bin/*").each do |file|
    link "/usr/local/bin/#{file.split('/').last}" do
      to file
    end
  end

end

harden_ruby("ruby-1.8.7-p302")