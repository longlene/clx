# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Terminal output paging in a cross-platform way supporting all major ruby interpreters"
HOMEPAGE="https://github.com/peter-murach/tty-pager"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/tty-screen-0.4.0"
ruby_add_rdepend ">=dev-ruby/tty-which-0.1.0"
ruby_add_rdepend ">=dev-ruby/verse-0.4.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"

