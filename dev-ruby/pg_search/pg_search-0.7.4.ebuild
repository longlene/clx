# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="PgSearch builds Active Record named scopes that take advantage of PostgreSQL's full text search"
HOMEPAGE="https://github.com/Casecommons/pg_search"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activerecord-3.1"
ruby_add_rdepend ">=dev-ruby/activesupport-3.1"
ruby_add_rdepend ">=dev-ruby/arel-0"

