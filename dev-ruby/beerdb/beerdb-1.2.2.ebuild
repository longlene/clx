# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="beerdb - beer"
HOMEPAGE="https://github.com/beerkit/beer.db"

LICENSE="Public Domain"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/beerdb-models-1.2.0"
ruby_add_rdepend ">=dev-ruby/beerdb-note-0.1.0"
ruby_add_rdepend ">=dev-ruby/datafile-0.2.5"
ruby_add_rdepend ">=dev-ruby/fetcher-0.4.5"
ruby_add_rdepend ">=dev-ruby/webservice-0.6.1"
ruby_add_rdepend ">=dev-ruby/gli-2.12.2"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/hoe-3.16"

