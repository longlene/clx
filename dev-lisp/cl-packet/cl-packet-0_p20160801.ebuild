# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="257f020e61f7fd8f82806fa535925114a4b7d0ea"

DESCRIPTION="Packet Codec and Protocol Analysis Library"
HOMEPAGE="https://github.com/mmaul/cl-packet"
SRC_URI="https://github.com/mmaul/cl-packet/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/alexandria
	dev-lisp/cl-annot
	dev-lisp/cl-syslog
	dev-lisp/flexi-streams
	dev-lisp/split-sequence
	dev-lisp/nst
	dev-lisp/plokami
	dev-lisp/iterate
	dev-lisp/lparallel
	dev-lisp/cl-variates
	dev-lisp/cl-redis
	dev-lisp/cl-influxdb
	dev-lisp/geoip
	dev-lisp/simple-date-time
	dev-lisp/apply-argv
"
