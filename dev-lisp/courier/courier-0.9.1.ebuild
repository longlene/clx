# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

DESCRIPTION="An email marketing service for Radiance"
HOMEPAGE="https://github.com/shirakumo/courier"
SRC_URI="https://github.com/Shirakumo/courier/archive/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/bordeaux-threads
	dev-lisp/radiance-contribs
	dev-lisp/drakma
	dev-lisp/feeder
	dev-lisp/ratify
	dev-lisp/alexandria
	dev-lisp/crypto-shortcuts
	dev-lisp/dns-client
	dev-lisp/cl-markless-plump
	dev-lisp/cl-smtp
	dev-lisp/cl-ppcre
	dev-lisp/cl-csv
"
BDEPEND=""
