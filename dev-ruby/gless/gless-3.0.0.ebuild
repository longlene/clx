# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="This gem attempts to provide a more robust model for web application testing, on top of Watir-WebDriver which already has significant improvements over just Selenium or WebDriver, based on describing pages and then interacting with the descriptions"
HOMEPAGE="http://github.com/rlpowell/gless"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/watir-webdriver-0"
ruby_add_rdepend ">=dev-ruby/selenium-webdriver-0"
ruby_add_rdepend ">=dev-ruby/debugger-0"
ruby_add_rdepend ">=dev-ruby/yard-0"
ruby_add_rdepend ">=dev-ruby/yard-tomdoc-0"

