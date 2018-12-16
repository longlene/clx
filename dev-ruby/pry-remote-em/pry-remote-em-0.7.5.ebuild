# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Connect to Pry remotely using EventMachine with tab-completion, paging, user auth and SSL"
HOMEPAGE="http://github.com/simulacre/pry-remote-em"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/eventmachine-0"
ruby_add_rdepend ">=dev-ruby/pry-0.9"
ruby_add_rdepend ">=dev-ruby/ruby-termios-0.9.6"
ruby_add_rdepend ">=dev-ruby/highline-0"

