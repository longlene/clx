# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="768036a1f9f7ee4b0edde0447fd5b64653e275d5"

DESCRIPTION="Common Lisp interface to the Time Series Database InfluxDB"
HOMEPAGE="https://github.com/mmaul/cl-influxdb"
SRC_URI="https://github.com/mmaul/cl-influxdb/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-json
	dev-lisp/drakma
	dev-lisp/do-urlencode
	dev-lisp/cl-annot
	dev-lisp/flexi-streams
	dev-lisp/usocket
"
