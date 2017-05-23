# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="HTTP::Cookie is a Ruby library to handle HTTP Cookies based on RFC 6265"
HOMEPAGE="https://github.com/sparklemotion/http-cookie"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/domain_name-0.5"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.3"
ruby_add_rdepend ">=dev-ruby/bundler-1.2.0"
ruby_add_rdepend ">=dev-ruby/test-unit-2.4.3"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2.2"
ruby_add_rdepend ">dev-ruby/rdoc-2.4.2"
ruby_add_rdepend ">=dev-ruby/simplecov-0"

