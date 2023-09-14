# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit common-lisp-3 vcs-snapshot

EGIT_COMMIT="4b334bc2fa45651bcaa28ae7d9331095d6bf0a17"

DESCRIPTION="A library to retrieve the system's configured locale and language settings"
HOMEPAGE=""https://github.com/Shinmera/system-locale
SRC_URI="https://github.com/Shinmera/system-locale/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="ZLIB"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}
	dev-lisp/documentation-utils
"
BDEPEND=""
