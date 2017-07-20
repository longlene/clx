# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    A Ruby client that tries to match Redis' API one-to-one, while still
    providing an idiomatic interface"
HOMEPAGE="https://github.com/redis/redis-rb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend "<dev-ruby/rake-11.0.0"
ruby_add_rdepend "=dev-ruby/test-unit-3.1.5"

