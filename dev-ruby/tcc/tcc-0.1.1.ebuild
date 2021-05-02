# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Tiny C Compiler is a small and fast C compiler, which makes C behavor like a script language"
HOMEPAGE="https://github.com/quark-zju/ruby-libtcc"

LICENSE="BSD LGPL"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/ffi-1.9.0"
ruby_add_rdepend ">=dev-ruby/rspec-2.14.1"

