# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Rb++ combines the powerful query interface of rbgccxml and the Rice library to
make Ruby wrapping extensions of C++ libraries easier to write than ever"
HOMEPAGE="http://rbplusplus.rubyforge.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rbgccxml-1.0"
ruby_add_rdepend ">=dev-ruby/rice-2.1"

