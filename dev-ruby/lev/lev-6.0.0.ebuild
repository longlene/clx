# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ride the rails but don't touch them"
HOMEPAGE="http://github.com/lml/lev"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activemodel-3.0"
ruby_add_rdepend ">=dev-ruby/activerecord-3.0"
ruby_add_rdepend ">=dev-ruby/actionpack-3.0"
ruby_add_rdepend ">=dev-ruby/transaction_isolation-0"
ruby_add_rdepend ">=dev-ruby/transaction_retry-0"
ruby_add_rdepend ">=dev-ruby/active_attr-0"
ruby_add_rdepend ">=dev-ruby/hashie-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/debugger-0"
ruby_add_rdepend ">=dev-ruby/activejob-0"
ruby_add_rdepend ">=dev-ruby/rails-0"

