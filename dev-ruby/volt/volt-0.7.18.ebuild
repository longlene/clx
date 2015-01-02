# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="http://voltframework.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0.18.0"
ruby_add_rdepend ">=dev-ruby/pry-0.9.12.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0.0"
ruby_add_rdepend ">=dev-ruby/rack-1.5.0"
ruby_add_rdepend ">=dev-ruby/sprockets-sass-1.0.0"
ruby_add_rdepend ">=dev-ruby/sass-3.2.5"
ruby_add_rdepend ">=dev-ruby/mongo-1.9.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0.4"
ruby_add_rdepend ">=dev-ruby/listen-2.7.0"
ruby_add_rdepend ">=dev-ruby/uglifier-2.4.0"
ruby_add_rdepend ">=dev-ruby/yui-compressor-0.12.0"
ruby_add_rdepend ">=dev-ruby/opal-0.6.0"
ruby_add_rdepend ">=dev-ruby/opal-jquery-0.2.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.5"
ruby_add_rdepend ">=dev-ruby/guard-2.0.1"
ruby_add_rdepend ">=dev-ruby/guard-rspec-1.2.0"
ruby_add_rdepend ">=dev-ruby/opal-rspec-0.2.1"
ruby_add_rdepend ">=dev-ruby/yard-0.8.7.0"
ruby_add_rdepend ">=dev-ruby/capybara-2.2.0"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-2.39.0"
ruby_add_rdepend ">=dev-ruby/chromedriver2-helper-0.0.8"
ruby_add_rdepend ">=dev-ruby/poltergeist-1.5.0"
ruby_add_rdepend ">=dev-ruby/sauce-3.3.0"
ruby_add_rdepend ">=dev-ruby/sauce-connect-3.3.0"

