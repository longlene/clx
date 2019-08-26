# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e27dbec74d060755c113850db5b372b72ebe712a"

DESCRIPTION="Common Lisp library fro Avro"
HOMEPAGE="https://github.com/SahilKang/cl-avro"
SRC_URI="https://github.com/SahilKang/cl-avro/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/trivial-gray-streams
	dev-lisp/babel
	dev-lisp/ieee-floats
	dev-lisp/st-json
"
BDEPEND=""
