# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A Ruby binding for curses, ncurses, and PDCurses, formerly part of the Ruby
standard library"
HOMEPAGE="https://github.com/ruby/curses"

LICENSE="Ruby BSD-2-Clause"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.2"
ruby_add_rdepend ">=dev-ruby/rdoc-4.0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0.8"
ruby_add_rdepend ">=dev-ruby/hoe-3.7"

