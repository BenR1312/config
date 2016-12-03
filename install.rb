#!/usr/bin/env ruby

require 'fileutils'

def create_symlink(source, destination)
  notice "ln -sF #{source} #{destination}"
  FileUtils.ln_sf(source, destination)
end

def heading(message)
  puts "\n\n-> #{message}\n\n"
end

def notice(message)
  puts message
end


heading "Adding symlinks for config files in home directory"
Dir.glob("dotfiles/.*").each do |file_path|

  # Exclude "." and ".."
  next if file_path.chars.last == "."

  source      = File.join(FileUtils.pwd, file_path)
  filename    = file_path.split("/").last
  destination = File.expand_path("~/#{filename}")

  create_symlink(source, destination)

end

heading "Add symlink for sublime text 2 user preferences"
Dir.glob("subl/**/*").each do |file_path|

  source = File.join(FileUtils.pwd, file_path)
  if File.directory?(source)
    notice("Skipping directory: #{source}")
  else
    filename = file_path.split("/").last
    destination = File.join(File.expand_path("~/"), "Library", "Application Support", "Sublime Text 2", "Packages", "User", filename)

    create_symlink(source, destination)
  end

end
