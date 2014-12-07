# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Run your jasmine tests in a real live browser!"
HOMEPAGE="http://pivotal.github.com/jasmine/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">dev-ruby/rails-3.0"
ruby_add_rdepend ">=dev-ruby/jasmine-2.0"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-2.35"
ruby_add_rdepend ">=dev-ruby/sauce-connect-0"

