# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The yui gem provides a Ruby API to drive graphical
(Qt, Gtk) or text-mode (ncurses) UIs with libyui"
HOMEPAGE="http://www.github.com/libyui/libyui-bindings"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-compiler-0"
ruby_add_rdepend ">=dev-ruby/mocha-0.9"
ruby_add_rdepend ">=dev-ruby/yard-0.5"

