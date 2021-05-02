# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="GnuCash invoice printer for human beings"
HOMEPAGE="http://ixti.github.com/gnucash-invoice"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sequel-3.41"
ruby_add_rdepend ">=dev-ruby/slim-1.3"
ruby_add_rdepend ">=dev-ruby/sass-3.2"
ruby_add_rdepend ">=dev-ruby/sprockets-2.8"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

