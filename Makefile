.PHONY: ruby deps serve build import-rss

default: serve

ruby:
	@echo "We assume that Ruby 2.7 and its bundler are already installed"
	# cf https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
	@echo "E.g. $ chruby 2.7.8"

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
