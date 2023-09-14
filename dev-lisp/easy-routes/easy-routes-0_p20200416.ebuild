# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4ead6d3d3e349b34b98be59289af56359be30cdf"

DESCRIPTION="Yet another routes handling utility on top of Hunchentoot"
HOMEPAGE="https://github.com/mmontone/easy-routes"
SRC_URI="https://github.com/mmontone/easy-routes/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/hunchentoot
	dev-lisp/cl-routes
"
