# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="2f853fcead554221d4be3b10522b502ea729e944"

DESCRIPTION="Common Lisp library for creating stealth mixin classes"
HOMEPAGE=""https://github.com/robert-strandh/Stealth-mixin
SRC_URI="https://github.com/robert-strandh/Stealth-mixin/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/closer-mop
"
BDEPEND=""
