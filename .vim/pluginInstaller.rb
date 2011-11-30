#!/usr/bin/env ruby

require 'term/ansicolorhi'

class String
	include Term::ANSIColorHI
end

git_bundles = [
	"git://github.com/msanders/snipmate.vim.git",
	"git://github.com/scrooloose/nerdtree.git",
	#"git://github.com/Raimondi/delimitMate.git",
	"git://github.com/Townk/vim-autoclose.git",
	"git://github.com/scrooloose/nerdcommenter.git"
]

vim_org_scripts = [
	["IndexedSearch", "7062",  "plugin"],
	["jquery",        "12107", "syntax"],
]

require 'fileutils'
require 'open-uri'

# Just to be sure we don't delete something we don't want to
bundles_dir = File.join(Dir.home, ".vim", "bundle")

if not File.directory? bundles_dir
	FileUtils.mkdir_p bundles_dir
end

FileUtils.cd(bundles_dir)

puts "Trashing everything (lookout!)".red
Dir["*"].each { |d|
	puts "Removing #{d}".blue
	FileUtils.rm_rf d
}

git_bundles.each do |url|
	dir = url.split('/').last.sub(/\.git$/, '')
	puts "Unpacking #{url} into #{dir}".yellow
	`git clone #{url} #{dir}`
	FileUtils.rm_rf(File.join(dir, ".git"))
end

vim_org_scripts.each do |name, script_id, script_type|
	puts "Downloading #{name}".yellow
	local_file = File.join(name, script_type, "#{name}.vim")
	FileUtils.mkdir_p(File.dirname(local_file))
	File.open(local_file, "w") do |file|
		file << open("http://www.vim.org/scripts/download_script.php?src_id=#{script_id}").read
	end
end
