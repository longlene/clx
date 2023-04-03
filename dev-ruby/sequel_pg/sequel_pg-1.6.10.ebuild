# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="sequel_pg overwrites the inner loop of the Sequel postgres
adapter row fetching code with a C version"
HOMEPAGE="http://github.com/jeremyevans/sequel_pg"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pg-0.8.0"
ruby_add_rdepend ">=dev-ruby/sequel-3.39.0"

