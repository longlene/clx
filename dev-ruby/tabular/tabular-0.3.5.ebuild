# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Tabular is a Ruby library for reading, writing, and manipulating CSV, tab-delimited and Excel data"
HOMEPAGE="http://github.com/scottwillson/tabular"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/roo-1.3"
ruby_add_rdepend ">=dev-ruby/roo-xls-0"

