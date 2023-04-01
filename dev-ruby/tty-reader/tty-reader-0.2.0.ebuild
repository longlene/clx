# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A set of methods for processing keyboard input in character, line and multiline modes"
HOMEPAGE="https://piotrmurach.github.io/tty"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/wisper-2.0.0"
ruby_add_rdepend ">=dev-ruby/tty-screen-0.6.4"
ruby_add_rdepend ">=dev-ruby/tty-cursor-0.5.0"
