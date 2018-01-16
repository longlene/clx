# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Combine 'pry' with 'debugger'"
HOMEPAGE="https://github.com/nixme/pry-debugger"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/pry-0.9.10"
ruby_add_rdepend ">=dev-ruby/debugger-1.3"
ruby_add_rdepend ">=dev-ruby/pry-remote-0.1.6"

