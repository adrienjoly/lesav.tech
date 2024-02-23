.PHONY: ruby deps serve build import-rss

default: serve

ruby:
	@echo "We assume that the right versino of Ruby and its bundler are already installed"
	# cf https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
	@echo "E.g. $ chruby 3.2.2 # cf .ruby-version file"

ruby-deps: ruby Gemfile Gemfile.lock
	bundle install

serve: ruby-deps
	bundle exec jekyll serve

build: ruby-deps
	rm -rf _site/
	bundle exec jekyll build

import-rss: ruby-deps
	ruby import-rss.rb
	@echo "✅ episodes imported into ./_posts/ directory"
