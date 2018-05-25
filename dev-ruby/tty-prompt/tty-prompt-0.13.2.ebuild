# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A beautiful and powerful interactive command line prompt with a robust API for getting and validating complex inputs"
HOMEPAGE="https://piotrmurach.github.io/tty"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/necromancer-0.4.0"
ruby_add_rdepend ">=dev-ruby/pastel-0.7.0"
ruby_add_rdepend ">=dev-ruby/timers-4.1.2"
ruby_add_rdepend ">=dev-ruby/tty-cursor-0.5.0"
ruby_add_rdepend ">=dev-ruby/tty-reader-0.1.0"
