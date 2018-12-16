# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Free Software, multi-threaded, non-blocking network application server
designed for low _idle_ power consumption"
HOMEPAGE="http://yahns.yhbt.net/README"

LICENSE="GPL-3.0+"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/kgio-2.9"
ruby_add_rdepend ">=dev-ruby/sleepy_penguin-3.2"
ruby_add_rdepend ">=dev-ruby/unicorn-4.6.3"
ruby_add_rdepend ">=dev-ruby/minitest-4.3"
ruby_add_rdepend ">=dev-ruby/rack-1.1"

