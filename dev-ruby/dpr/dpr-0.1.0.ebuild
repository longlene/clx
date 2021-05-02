# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

USE_RUBY="ruby25 ruby26"

#RUBY_FAKEGEM_RECIPE_DOC="yard"
RUBY_FAKEGEM_RECIPE_TEST="rspec"
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="The simplest Ruby HTTP client"
HOMEPAGE="https://github.com/SudhagarS/dpr"
SRC_URI="https://github.com/SudhagarS/dpr/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-ruby/rest-client
"
all_ruby_prepare() {
	sed -e '/git ls-files/d' \
		-i ${RUBY_FAKEGEM_GEMSPEC}
}
