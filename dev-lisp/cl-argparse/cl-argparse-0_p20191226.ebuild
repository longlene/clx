# Copyright 2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="9698812737b6cb88534a012ed8a887b537b3dd85"

DESCRIPTION="A common lisp cmd argument parser inspired by python argparse"
HOMEPAGE="https://github.com/simkoc/cl-argparse/"
SRC_URI="https://github.com/simkoc/cl-argparse/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
