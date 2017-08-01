# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby21 ruby22 ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A kdtree is a data structure that makes it possible to quickly solve
the nearest neighbor problem"
HOMEPAGE="http://github.com/gurgeous/kdtree"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-1.0"

