# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Free Software, multi-threaded, non-blocking network application server designed for low _idle_ power consumption"
HOMEPAGE="http://yahns.yhbt.net/README"

LICENSE="GPLv3+"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/kgio-2.9"
ruby_add_rdepend ">=dev-ruby/sleepy_penguin-3.2"
ruby_add_rdepend ">=dev-ruby/kgio-sendfile-1.2"
ruby_add_rdepend ">=dev-ruby/unicorn-4.6"
ruby_add_rdepend ">=dev-ruby/minitest-4.3"

