# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby helper for running tests in Sauce Labs' browser testing cloud service"
HOMEPAGE="http://github.com/sauce-labs/sauce_ruby"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-2.14.0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/capybara-2.2.1"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/net-http-persistent-0"
ruby_add_rdepend ">=dev-ruby/rest-client-0"
ruby_add_rdepend ">=dev-ruby/net-ssh-0"
ruby_add_rdepend ">=dev-ruby/net-ssh-gateway-0"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-0.1.2"
ruby_add_rdepend ">=dev-ruby/childprocess-0.1.6"
ruby_add_rdepend ">=dev-ruby/json-1.2.0"
ruby_add_rdepend ">=dev-ruby/cmdparse-2.0.2"
ruby_add_rdepend ">=dev-ruby/highline-1.5.0"
ruby_add_rdepend ">=dev-ruby/parallel_tests-1.0.6"
ruby_add_rdepend ">=dev-ruby/sauce_whisk-0.0.11"

