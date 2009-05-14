namespace :radiant do
  namespace :extensions do
    namespace :anonymous_page do
      
      desc "Runs the migration of the Anonymous Page extension"
      task :migrate => :environment do
        require 'radiant/extension_migrator'
        if ENV["VERSION"]
          AnonymousPageExtension.migrator.migrate(ENV["VERSION"].to_i)
        else
          AnonymousPageExtension.migrator.migrate
        end
      end
      
      desc "Copies public assets of the Anonymous Page to the instance public/ directory."
      task :update => :environment do
        is_svn_or_dir = proc {|path| path =~ /\.svn/ || File.directory?(path) }
        puts "Copying assets from AnonymousPageExtension"
        Dir[AnonymousPageExtension.root + "/public/**/*"].reject(&is_svn_or_dir).each do |file|
          path = file.sub(AnonymousPageExtension.root, '')
          directory = File.dirname(path)
          mkdir_p RAILS_ROOT + directory
          cp file, RAILS_ROOT + path
        end
      end  
    end
  end
end
