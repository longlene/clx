# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A statesmanlike state machine library"
HOMEPAGE="https://github.com/gocardless/statesman"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.1"
ruby_add_rdepend ">=dev-ruby/rspec-its-1.1"
ruby_add_rdepend ">=dev-ruby/guard-rspec-4.3"
ruby_add_rdepend ">=dev-ruby/rubocop-0.30.0"
ruby_add_rdepend ">=dev-ruby/guard-rubocop-1.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3"
ruby_add_rdepend ">=dev-ruby/mongoid-3.1"
ruby_add_rdepend ">=dev-ruby/rails-3.2"
ruby_add_rdepend ">=dev-ruby/pg-0.18"
ruby_add_rdepend ">=dev-ruby/mysql2-0.3"
ruby_add_rdepend ">=dev-ruby/ammeter-1.1"

