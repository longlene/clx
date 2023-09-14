# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="70a3150c806c4612fa0ea7f90c2041e415dd80d5"

DESCRIPTION="Common Lisp CFFI interface to OpenCL"
HOMEPAGE="https://github.com/ghollisjr/cl-opencl"
SRC_URI="https://github.com/ghollisjr/cl-opencl/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="public-domain"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/cffi
"
BDEPEND=""
