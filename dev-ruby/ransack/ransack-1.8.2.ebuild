# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ransack is the successor to the MetaSearch gem"
HOMEPAGE="https://github.com/activerecord-hackery/ransack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/actionpack-3.0"
ruby_add_rdepend ">=dev-ruby/activerecord-3.0"
ruby_add_rdepend ">=dev-ruby/activesupport-3.0"
ruby_add_rdepend ">=dev-ruby/i18n-0"
ruby_add_rdepend ">=dev-ruby/polyamorous-1.3"
ruby_add_rdepend ">=dev-ruby/rspec-3"
ruby_add_rdepend ">=dev-ruby/machinist-1.0.6"
ruby_add_rdepend ">=dev-ruby/faker-0.9.5"
ruby_add_rdepend ">=dev-ruby/sqlite3-1.3.3"
ruby_add_rdepend ">=dev-ruby/pg-0"
ruby_add_rdepend "=dev-ruby/mysql2-0.3.20"
ruby_add_rdepend "=dev-ruby/pry-0.10"

