# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="riak-client is a rich client for Riak, the distributed database by Basho"
HOMEPAGE="http://github.com/basho/riak-ruby-client"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-4.2"
ruby_add_rdepend ">=dev-ruby/instrumentable-1.1"
ruby_add_rdepend ">=dev-ruby/kramdown-1.4"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/rubocop-0.40.0"
ruby_add_rdepend "=dev-ruby/single_cov-0.5.7"
ruby_add_rdepend ">=dev-ruby/yard-0.8"
ruby_add_rdepend ">=dev-ruby/beefcake-1.1"
ruby_add_rdepend ">=dev-ruby/cert_validator-0.0.1"
ruby_add_rdepend ">=dev-ruby/i18n-0.6"
ruby_add_rdepend ">=dev-ruby/innertube-1.0"
ruby_add_rdepend ">=dev-ruby/multi_json-1.0"

