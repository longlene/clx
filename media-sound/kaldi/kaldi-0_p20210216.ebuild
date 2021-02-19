# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit cmake-utils vcs-snapshot

EGIT_COMMIT="d6198906fbb0e3cfa5fae313c7126a78d8321801"

DESCRIPTION=""
HOMEPAGE="https://github.com/kaldi-asr/kaldi"
SRC_URI="https://github.com/kaldi-asr/kaldi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
