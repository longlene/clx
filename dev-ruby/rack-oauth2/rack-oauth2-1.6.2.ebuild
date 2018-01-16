# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="OAuth 2"
HOMEPAGE="http://github.com/nov/rack-oauth2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.1"
ruby_add_rdepend ">=dev-ruby/multi_json-1.3.6"
ruby_add_rdepend ">=dev-ruby/httpclient-2.4"
ruby_add_rdepend ">=dev-ruby/activesupport-2.3"
ruby_add_rdepend ">=dev-ruby/attr_required-0.0.5"
ruby_add_rdepend ">=dev-ruby/rake-0.8"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/rspec-its-0"
ruby_add_rdepend "<dev-ruby/webmock-1.24"

