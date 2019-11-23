# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    The html-table library provides an interface for generating HTML tables
    in a syntax comfortable to Ruby programmers, but with some enforcement
    of where certain elements can be placed"
HOMEPAGE="http://github.com/djberg96/html-table"

LICENSE="Artistic 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/strongtyping-0"
ruby_add_rdepend ">=dev-ruby/structured_warnings-0"
ruby_add_rdepend ">=dev-ruby/test-unit-0"
ruby_add_rdepend ">=dev-ruby/rake-0"

