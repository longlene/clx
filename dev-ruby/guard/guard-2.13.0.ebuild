# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Guard is a command line tool to easily handle events on file system modifications"
HOMEPAGE="http://guardgem.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/thor-0.18.1"
ruby_add_rdepend ">=dev-ruby/listen-2.7"
ruby_add_rdepend ">=dev-ruby/pry-0.9.12"
ruby_add_rdepend ">=dev-ruby/lumberjack-1.0"
ruby_add_rdepend ">=dev-ruby/formatador-0.2.4"
ruby_add_rdepend ">=dev-ruby/nenv-0.1"
ruby_add_rdepend ">=dev-ruby/shellany-0.0"
ruby_add_rdepend ">=dev-ruby/notiffany-0.0"

