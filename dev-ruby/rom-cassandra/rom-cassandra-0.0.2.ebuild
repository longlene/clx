# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Cassandra support for Ruby Object Mapper"
HOMEPAGE="https://rom-rb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/cassandra-driver-2.1"
ruby_add_rdepend ">=dev-ruby/inflecto-0.0"
ruby_add_rdepend ">=dev-ruby/query_builder-0.0"
ruby_add_rdepend ">=dev-ruby/rom-0.9.1"
ruby_add_rdepend ">=dev-ruby/hexx-rspec-0.5"
ruby_add_rdepend ">=dev-ruby/timecop-0.8"

