# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Implements the DataObjects API for Sqlite3"
HOMEPAGE=""

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "=dev-ruby/data_objects-0.10.17"
ruby_add_rdepend ">=dev-ruby/rspec-2.5"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.7"

