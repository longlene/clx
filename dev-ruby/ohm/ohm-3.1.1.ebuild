# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ohm is a library that allows to store an object in Redis, a persistent key-value database"
HOMEPAGE="http://soveran.github.io/ohm/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redic-1.5.0"
ruby_add_rdepend ">=dev-ruby/nest-3"
ruby_add_rdepend ">=dev-ruby/stal-0"
ruby_add_rdepend ">=dev-ruby/cutest-0"

