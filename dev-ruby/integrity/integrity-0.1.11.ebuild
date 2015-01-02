# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Your Friendly Continuous Integration server"
HOMEPAGE="http://integrityapp.com"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/sinatra-authorization-0"
ruby_add_rdepend ">=dev-ruby/haml-2.0.0"
ruby_add_rdepend ">=dev-ruby/builder-0"
ruby_add_rdepend "=dev-ruby/data_mapper-0.9.11"
ruby_add_rdepend ">=dev-ruby/uuidtools-0"
ruby_add_rdepend ">=dev-ruby/bcrypt-ruby-0"
ruby_add_rdepend ">=dev-ruby/json-0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/rr-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"
ruby_add_rdepend ">=dev-ruby/webrat-0"
ruby_add_rdepend ">=dev-ruby/do_sqlite3-0"
ruby_add_rdepend ">=dev-ruby/dm-sweatshop-0"
ruby_add_rdepend ">=dev-ruby/ParseTree-0"
ruby_add_rdepend ">=dev-ruby/jeremymcanally-context-0"
ruby_add_rdepend ">=dev-ruby/jeremymcanally-matchy-0"
ruby_add_rdepend ">=dev-ruby/jeremymcanally-pending-0"
ruby_add_rdepend ">=dev-ruby/foca-storyteller-0"

