# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="    Daemons provides an easy way to wrap existing ruby scripts (for example a
    self-written server)  to be run as a daemon and to be controlled by simple
    start/stop/restart commands"
HOMEPAGE="https://github.com/thuehlinger/daemons"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-3.1"
ruby_add_rdepend ">=dev-ruby/simplecov-0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-3.0.0"

