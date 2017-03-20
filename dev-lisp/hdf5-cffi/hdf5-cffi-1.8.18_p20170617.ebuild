# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="18043c38bf74e5dbb893cfe0d8bcf24a5613e9b2"

DESCRIPTION="Common Lisp bindings for the HDF5 library using CFFI"
HOMEPAGE="https://github.com/HDFGroup/hdf5-cffi"
SRC_URI="https://github.com/HDFGroup/hdf5-cffi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
	sci-libs/hdf5
"
