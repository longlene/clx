# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Capybara is an integration testing tool for rack based web applications"
HOMEPAGE="http://github.com/jnicklas/capybara"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/nokogiri-1.3.3"
ruby_add_rdepend ">=dev-ruby/mime-types-1.16"
ruby_add_rdepend ">=dev-ruby/rack-1.0.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0.5.4"
ruby_add_rdepend ">=dev-ruby/xpath-2.0"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-2.0"
ruby_add_rdepend ">=dev-ruby/sinatra-0.9.4"
ruby_add_rdepend ">=dev-ruby/rspec-2.2.0"
ruby_add_rdepend ">=dev-ruby/launchy-2.0.4"
ruby_add_rdepend ">=dev-ruby/yard-0.5.8"
ruby_add_rdepend ">=dev-ruby/fuubar-0.0.1"
ruby_add_rdepend ">=dev-ruby/cucumber-0.10.5"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/pry-0"

