# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A ruby module to provide a simple send/expect interface over SSH with an API almost identical to Net::Telnet"
HOMEPAGE="http://net-ssh-telnet.rubyforge.org"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/net-ssh-2.0.1"
ruby_add_rdepend ">=dev-ruby/hoe-1.7.0"

