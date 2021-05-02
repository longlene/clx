# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/dry-rb/dry-transaction"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/dry-container-0.2.8"
ruby_add_rdepend ">=dev-ruby/dry-events-0.1.0"
ruby_add_rdepend ">=dev-ruby/dry-matcher-0.7.0"
ruby_add_rdepend ">=dev-ruby/dry-monads-0.4.0"
