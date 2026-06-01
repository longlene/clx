# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit elisp

DESCRIPTION="A collection of Clojure refactoring functions for Emacs"
HOMEPAGE="https://github.com/clojure-emacs/clj-refactor.el"
SRC_URI="https://github.com/clojure-emacs/clj-refactor.el/archive/${PV}.tar.gz -> ${P}.tar.gz"

SLOT="0"
S="${WORKDIR}"/${PN}.el-${PV}
KEYWORDS="~amd64 ~x86"

DEPEND="
	app-emacs/yasnippet
	app-emacs/paredit
	app-emacs/multiple-cursors
	app-emacs/clojure-mode
	app-emacs/cider
	app-emacs/edn
	app-emacs/inflections
	app-emacs/hydra
	app-emacs/subword
"
RDEPEND="${DEPEND}"
