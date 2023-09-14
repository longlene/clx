# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

EGIT_COMMIT="e72ea630d28b123d541c0799014420f59ba91aae"

DESCRIPTION="clsxwm"
HOMEPAGE="https://github.com/ikbenlike/clsxwm"
SRC_URI="https://github.com/ikbenlike/clsxwm/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/clx
"
BDEPEND=""
