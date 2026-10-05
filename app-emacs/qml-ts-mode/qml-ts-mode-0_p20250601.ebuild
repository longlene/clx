# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

COMMIT="b80c6663521b4d0083e416e6712ebc02d37b7aec"

NEED_EMACS="29.1"

inherit elisp

DESCRIPTION="Emacs major mode for editing Qt Declarative (QML) code"
HOMEPAGE="https://github.com/xhcoding/qml-ts-mode"
SRC_URI="https://github.com/xhcoding/qml-ts-mode/archive/${COMMIT}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/qml-ts-mode-${COMMIT}"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="dev-libs/tree-sitter-language-provider
	dev-libs/tree-sitter-qmljs"
DEPEND="${RDEPEND}"

SITEFILE="50${PN}-gentoo.el"
DOCS=( README.md )
