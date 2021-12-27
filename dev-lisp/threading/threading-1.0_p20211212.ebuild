# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="e2a695bf9a667de36a1a621c81ec2ccd53570e18"

DESCRIPTION="Value threading macros for Common Lisp"
HOMEPAGE="https://github.com/massung/threading"
SRC_URI="https://github.com/massung/threading/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
