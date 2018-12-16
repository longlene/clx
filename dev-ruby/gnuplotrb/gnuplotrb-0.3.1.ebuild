# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.rdoc"
RUBY_FAKEGEM_GEMSPEC=""

inherit ruby-fakegem

DESCRIPTION="GnuplotRB is a plot generator for Ruby based on Gnuplot"
HOMEPAGE="https://github.com/SciRuby/gnuplotrb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hamster-1.0"

all_ruby_prepare() {
	sed -i -e '/git ls-files/d' ${PN}.gemspec
}
