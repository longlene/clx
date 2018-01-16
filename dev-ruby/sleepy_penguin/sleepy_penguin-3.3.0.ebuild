# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="sleepy_penguin provides access to newer, Linux-only system calls to wait
on events from traditionally non-I/O sources"
HOMEPAGE="http://bogomips.org/sleepy_penguin/"

LICENSE="LGPLv2.1 LGPLv3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/wrongdoc-1.5"
ruby_add_rdepend ">=dev-ruby/strace_me-1.0"

