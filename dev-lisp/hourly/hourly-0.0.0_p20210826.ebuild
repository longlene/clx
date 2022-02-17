# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="490cdce51890175eaca1a3df85abafc7ecefc62d"

DESCRIPTION="Hour tracking service"
HOMEPAGE="https://github.com/Shirakumo/hourly"
SRC_URI="https://github.com/Shirakumo/hourly/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/r-data-model
	dev-lisp/r-clip
	dev-lisp/i-json
	dev-lisp/alexandria
	dev-lisp/cl-csv
"
BDEPEND=""
