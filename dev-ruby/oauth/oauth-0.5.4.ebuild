# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE=""

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/minitest-0"
ruby_add_rdepend ">=dev-ruby/byebug-0"
ruby_add_rdepend ">=dev-ruby/actionpack-5.0"
ruby_add_rdepend ">=dev-ruby/iconv-0"
ruby_add_rdepend ">=dev-ruby/rack-2.0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/mocha-0.9.12"
ruby_add_rdepend ">=dev-ruby/typhoeus-0.1.13"
ruby_add_rdepend "=dev-ruby/em-http-request-0.2.11"
ruby_add_rdepend ">=dev-ruby/curb-0"
ruby_add_rdepend "<dev-ruby/webmock-2.0"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/rest-client-0"

