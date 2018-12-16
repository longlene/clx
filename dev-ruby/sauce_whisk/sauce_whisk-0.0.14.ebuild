# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Wrapper for the Sauce Labs REST API"
HOMEPAGE="http://www.github.com/dylanlacey/sauce_whisk"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rest-client-1.7.1"
ruby_add_rdepend ">=dev-ruby/json-1.8.1"
ruby_add_rdepend ">=dev-ruby/vcr-2.9.0"
ruby_add_rdepend ">=dev-ruby/webmock-1.18.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0.0"
ruby_add_rdepend ">=dev-ruby/rake-10.3.2"

