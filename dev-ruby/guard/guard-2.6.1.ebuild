# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="Guard is a command line tool to easily handle events on file system modifications."
HOMEPAGE="http://guardgem.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/formatador-0.2.4"
ruby_add_rdepend ">=dev-ruby/listen-2.7"
ruby_add_rdepend ">=dev-ruby/lumberjack-1.0"
ruby_add_rdepend ">=dev-ruby/pry-0.9.12"
ruby_add_rdepend ">=dev-ruby/thor-0.18.1"

