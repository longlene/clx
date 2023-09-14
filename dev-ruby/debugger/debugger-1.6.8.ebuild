# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="debugger is a fast implementation of the standard Ruby debugger debug"
HOMEPAGE="http://github.com/cldwalker/debugger"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/columnize-0.3.1"
ruby_add_rdepend ">=dev-ruby/debugger-ruby_core_source-1.3.5"
ruby_add_rdepend ">=dev-ruby/debugger-linecache-1.2.0"
ruby_add_rdepend ">=dev-ruby/rake-0.9.2.2"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.8.0"
ruby_add_rdepend ">=dev-ruby/minitest-2.12.1"
ruby_add_rdepend ">=dev-ruby/mocha-0.13.0"

