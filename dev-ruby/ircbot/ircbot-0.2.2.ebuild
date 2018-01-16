# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="An irc bot framework that offers easy-to-use by plugins"
HOMEPAGE="http://github.com/maiha/ircbot"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dsl_accessor-0.4.0"
ruby_add_rdepend ">=dev-ruby/extlib-0.9.14"
ruby_add_rdepend ">=dev-ruby/net-irc-0.0.9"
ruby_add_rdepend ">=dev-ruby/chawan-0"
ruby_add_rdepend ">=dev-ruby/night-time-0"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/dm-core-0"
ruby_add_rdepend ">=dev-ruby/dm-migrations-0"
ruby_add_rdepend ">=dev-ruby/dm-timestamps-0"
ruby_add_rdepend ">=dev-ruby/do_sqlite3-0"
ruby_add_rdepend ">=dev-ruby/data_objects-0"
ruby_add_rdepend ">=dev-ruby/dm-sqlite-adapter-0"
ruby_add_rdepend ">=dev-ruby/dm-postgres-adapter-0"
ruby_add_rdepend ">=dev-ruby/rspec-2.9.0"

