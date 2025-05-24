.PHONY: ruby ruby-deps serve build import-rss

default: serve

ruby:
	@echo "We assume that Ruby 3.4.4 and its bundler are already installed"
	# cf https://www.moncefbelyamani.com/how-to-install-xcode-homebrew-git-rvm-ruby-on-mac/
	@echo "E.g. $ ruby-install 3.4.4 -- --enable-shared; echo 'restart your terminal'; chruby 3.4.4"

ruby-deps: ruby Gemfile Gemfile.lock
	bundle install

serve: ruby-deps
	bundle exec jekyll serve

build: ruby-deps
	rm -rf _site/
	bundle exec jekyll build

import-rss: ruby-deps
	# gem install jekyll-import -v 0.24
	ruby import-rss.rb || echo "💡 In case of warnings from gems, you may need to run $ gem pristine --all"
	@echo "✅ episodes imported into ./_posts/ directory"
