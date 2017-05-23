# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Faster, Better, Simpler"
HOMEPAGE="http://datamapper.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dm-core-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-aggregates-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-constraints-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-migrations-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-transactions-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-serializer-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-timestamps-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-validations-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-types-1.2.0"
ruby_add_rdepend ">=dev-ruby/hoe-2.12"

