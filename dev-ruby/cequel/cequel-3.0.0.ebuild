# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Cequel is an ActiveRecord-like domain model layer for Cassandra that exposes
the robust data modeling capabilities of CQL3, including parent-child
relationships via compound primary keys and in-memory atomic manipulation of
collection columns"
HOMEPAGE="https://github.com/cequel/cequel"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemodel-4.0"
ruby_add_rdepend ">=dev-ruby/cassandra-driver-3.0"
ruby_add_rdepend ">=dev-ruby/appraisal-1.0"
ruby_add_rdepend ">=dev-ruby/wwtd-0.5"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.5"
ruby_add_rdepend ">=dev-ruby/rspec-its-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-retry-0.5"
ruby_add_rdepend ">=dev-ruby/rubocop-0.28"
ruby_add_rdepend ">=dev-ruby/timecop-0.7"
ruby_add_rdepend ">=dev-ruby/travis-1.7"
ruby_add_rdepend ">=dev-ruby/yard-0.6"

