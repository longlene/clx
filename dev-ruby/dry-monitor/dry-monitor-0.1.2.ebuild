# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION=""
HOMEPAGE="https://github.com/dry-rb/dry-monitor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rouge-2.0"
ruby_add_rdepend ">=dev-ruby/dry-equalizer-0.2"
ruby_add_rdepend ">=dev-ruby/dry-configurable-0.5"
ruby_add_rdepend ">=dev-ruby/dry-events-0.1"
