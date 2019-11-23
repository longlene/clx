# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Test your JavaScript without any framework dependencies, in any environment, and with a nice descriptive syntax"
HOMEPAGE="http://pivotal.github.com/jasmine"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/sauce-connect-0"
ruby_add_rdepend ">=dev-ruby/compass-0"
ruby_add_rdepend ">=dev-ruby/jasmine_selenium_runner-0.2.0"

