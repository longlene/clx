# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="gmp - providing Ruby bindings to the GMP and MPFR libraries"
HOMEPAGE="http://github.com/srawlins/gmp"

LICENSE="Apache License Version 2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""


