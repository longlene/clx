# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ohm is a library that allows to store an object in Redis, a persistent key-value database. It has very good performance."
HOMEPAGE="http://soveran.github.io/ohm/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/msgpack-0"
ruby_add_rdepend ">=dev-ruby/nido-0"
ruby_add_rdepend ">=dev-ruby/redic-0"

