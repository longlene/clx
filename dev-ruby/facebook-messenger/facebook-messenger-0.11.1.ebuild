# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Facebook Messenger client"
HOMEPAGE="https://github.com/hyperoslo/facebook-messenger"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/httparty-0.13"
ruby_add_rdepend ">=dev-ruby/rack-1.6.4"
ruby_add_rdepend ">=dev-ruby/bundler-1.11"
ruby_add_rdepend ">=dev-ruby/rspec-3.4"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6.3"
ruby_add_rdepend ">=dev-ruby/rubocop-0.39"
ruby_add_rdepend ">=dev-ruby/webmock-1.24"
ruby_add_rdepend ">=dev-ruby/rake-11.0"
ruby_add_rdepend ">=dev-ruby/coveralls-0"
ruby_add_rdepend ">=dev-ruby/pry-0"

