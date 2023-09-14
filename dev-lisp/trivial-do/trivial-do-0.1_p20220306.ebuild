# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="a19f93227cb80a6bec8846655ebcc7998020bd7e"

DESCRIPTION="Additional dolist style macros for Common Lisp"
HOMEPAGE="https://github.com/yitzchak/trivial-do"
SRC_URI="https://github.com/yitzchak/trivial-do/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
