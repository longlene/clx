# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="956f69fdb4f91d993c09865346e0e6e1c7c662b2"

DESCRIPTION="Common Lisp library to provide a universal configuration layer"
HOMEPAGE="https://github.com/Shinmera/universal-config"
SRC_URI="https://github.com/Shinmera/universal-config/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Artistic-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cl-ppcre
	dev-lisp/parse-float
"
BDEPEND=""
