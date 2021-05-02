# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Socketry wraps Ruby's sockets with an advanced timeout engine which is able to provide multiple simultaneous timeout behaviors in a thread-safe way"
HOMEPAGE="https://github.com/socketry/socketry/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hitimes-1.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"

