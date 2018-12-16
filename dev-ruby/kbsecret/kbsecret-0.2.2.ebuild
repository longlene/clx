# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Manages your passwords, environment, and more via KBFS"
HOMEPAGE="https://github.com/woodruffw/kbsecret"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/keybase-unofficial-0.0.6"
ruby_add_rdepend ">=dev-ruby/slop-4.4"
ruby_add_rdepend ">=dev-ruby/tty-prompt-0.10.0"
ruby_add_rdepend ">=dev-ruby/clipboard-1.1"

