# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Nokogiri based 'have_tag' and 'with_tag' matchers for rspec 2"
HOMEPAGE="http://github.com/kucaahbe/rspec-html-matchers"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-3"
ruby_add_rdepend ">=dev-ruby/nokogiri-1"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/cucumber-1"
ruby_add_rdepend ">=dev-ruby/capybara-2"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-2"
ruby_add_rdepend ">=dev-ruby/sinatra-1"
ruby_add_rdepend ">=dev-ruby/rake-10"
ruby_add_rdepend ">=dev-ruby/travis-lint-1"
ruby_add_rdepend ">=dev-ruby/debugger-1"

