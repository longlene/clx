# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="8cd7c0a37da122fc2bb27739b0869124ace9e9dc"

DESCRIPTION="BERT-RPC for Common Lisp"
HOMEPAGE="https://github.com/flambard/cl-bert"
SRC_URI="https://github.com/flambard/cl-bert/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/erlang-term
	dev-lisp/alexandria
"
BDEPEND=""
