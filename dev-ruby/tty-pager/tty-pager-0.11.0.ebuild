# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Terminal output paging in a cross-platform way supporting all major ruby interpreters"
HOMEPAGE="https://github.com/piotrmurach/tty-pager"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/tty-screen-0.6.4"
ruby_add_rdepend ">=dev-ruby/tty-which-0.3.0"
ruby_add_rdepend ">=dev-ruby/strings-0.1.0"
