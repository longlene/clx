# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=6

inherit common-lisp-3 git-r3

DESCRIPTION="Common Lisp interface to the Time Series Database InfluxDB"
HOMEPAGE="https://github.com/mmaul/cl-influxdb"
SRC_URI=""

EGIT_REPO_URI="https://github.com/mmaul/cl-influxdb.git"

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
