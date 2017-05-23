# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Ruby bindings for X11"
HOMEPAGE="https://github.com/christopheraue/ruby-xlib-objects"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/xlib-1.1"
ruby_add_rdepend ">=dev-ruby/rspec-3.2.0"
ruby_add_rdepend ">=dev-ruby/rspec-its-1.1"
ruby_add_rdepend ">=dev-ruby/rspec-mocks-matchers-send_message-0.1"

