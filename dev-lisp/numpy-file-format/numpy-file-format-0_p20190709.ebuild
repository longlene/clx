# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="0a6d1545b6bf66ae74e1a77ef40fb3a200d16a37"

DESCRIPTION="Read and write Numpy .npy and .npz files"
HOMEPAGE="https://github.com/marcoheisig/numpy-file-format"
SRC_URI="https://github.com/marcoheisig/numpy-file-format/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/ieee-floats
"
BDEPEND=""
