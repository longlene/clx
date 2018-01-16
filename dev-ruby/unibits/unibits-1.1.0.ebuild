# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Visualizes Unicode encodings in the terminal"
HOMEPAGE="https://github.com/janlelis/unibits"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/paint-0.9"
ruby_add_rdepend ">=dev-ruby/unicode-display_width-1.1"
ruby_add_rdepend ">=dev-ruby/rationalist-2.0"

