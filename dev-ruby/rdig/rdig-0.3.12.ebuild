# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Website crawler and fulltext indexer"
HOMEPAGE="http://github.com/jkraemer/rdig/"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ferret-0.11.6"
ruby_add_rdepend ">=dev-ruby/hpricot-0.6"
ruby_add_rdepend ">=dev-ruby/htmlentities-4.0.0"

