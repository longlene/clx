# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{13..15} )

inherit distutils-r1

DESCRIPTION="Work with email by IMAP"
HOMEPAGE="https://github.com/ikvk/imap_tools"
SRC_URI="https://github.com/ikvk/imap_tools/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/imap_tools-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
