# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Automatically run common development tasks on events, as prescribed in a local "
HOMEPAGE="http://github.com/jbe/sidekick"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/tilt-1"
ruby_add_rdepend ">=dev-ruby/eventmachine-0"
ruby_add_rdepend ">=dev-ruby/em-dir-watcher-0"

