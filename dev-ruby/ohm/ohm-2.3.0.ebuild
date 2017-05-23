# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ohm is a library that allows to store an object in Redis, a persistent key-value database"
HOMEPAGE="http://soveran.github.io/ohm/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/redic-1.5.0"
ruby_add_rdepend ">=dev-ruby/nido-0"
ruby_add_rdepend ">=dev-ruby/stal-0"
ruby_add_rdepend ">=dev-ruby/msgpack-0.5.0"
ruby_add_rdepend ">=dev-ruby/cutest-0"

