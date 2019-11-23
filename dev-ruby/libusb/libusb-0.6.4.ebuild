# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby22 ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="LIBUSB is a Ruby binding that gives Ruby programmers access to arbitrary USB devices"
HOMEPAGE="http://github.com/larskanis/libusb"

LICENSE="LGPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0"
ruby_add_rdepend ">=dev-ruby/mini_portile2-2.1"
ruby_add_rdepend ">=dev-ruby/rake-compiler-1.0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-dock-0.2"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/yard-0.6"

