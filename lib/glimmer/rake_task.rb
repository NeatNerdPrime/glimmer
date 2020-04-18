namespace :glimmer do
  namespace :package do
    desc 'Generate JAR config file'
    task :config do
      project_name = File.basename(File.expand_path('.'))
      if !File.exists?('config/warble.rb')
        system('mkdir -p config')
        system('warble config')
        new_config = File.read('config/warble.rb').split("\n").inject('') do |output, line|
          if line.include?('config.dirs =')
            line = line.sub('# ', '').sub(/=[^=\n]+$/, '= %w(app config db lib script bin images sounds videos)')
          end
          if line.include?('config.autodeploy_dir =')
            line = line.sub('# ', '')
          end
          output + "\n" + line
        end
        File.write('config/warble.rb', new_config)
      end
    end
  end

  desc 'Package app for distribution'
  task :package => 'package:config' do
    project_name = File.basename(File.expand_path('.'))
    system('mkdir -p dist')
    system('warble')
    command = "javapackager -deploy -native -outdir packages -outfile #{project_name} -srcdir dist -srcfiles #{project_name}.jar -appclass JarMain -name \"#{project_name}\" -title \"#{project_name}\" -BjvmOptions=-XstartOnFirstThread"
    command += " #{ENV['JAVAPACKAGER_EXTRA_ARGS']}" if ENV['JAVAPACKAGER_EXTRA_ARGS']
    puts command
    system command
  end
end