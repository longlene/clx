# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="WebDriver is a tool for writing automated tests of websites"
HOMEPAGE="https://github.com/SeleniumHQ/selenium"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rubyzip-1.2"
ruby_add_rdepend ">=dev-ruby/childprocess-0.5"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rack-1.0"
ruby_add_rdepend ">=dev-ruby/webmock-2.0"
ruby_add_rdepend ">=dev-ruby/yard-0.9.11"
ruby_add_rdepend ">=dev-ruby/rubocop-0.50.0"

