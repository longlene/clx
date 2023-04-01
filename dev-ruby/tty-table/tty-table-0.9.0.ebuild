# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A flexible and intuitive table generator"
HOMEPAGE="https://piotrmurach.github.io/tty/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/equatable-0.5.0"
ruby_add_rdepend ">=dev-ruby/necromancer-0.4.0"
ruby_add_rdepend ">=dev-ruby/pastel-0.7.0"
ruby_add_rdepend ">=dev-ruby/tty-screen-0.6.0"
ruby_add_rdepend ">=dev-ruby/verse-0.5.0"
ruby_add_rdepend ">=dev-ruby/unicode-display_width-1.1.0"
