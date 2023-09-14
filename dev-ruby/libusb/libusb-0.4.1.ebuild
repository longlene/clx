# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="LIBUSB is a Ruby binding that gives Ruby programmers access to arbitrary USB devices"
HOMEPAGE="http://github.com/larskanis/libusb"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.6"
ruby_add_rdepend ">=dev-ruby/bundler-0"

