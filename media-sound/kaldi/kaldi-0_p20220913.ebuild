# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake vcs-snapshot

EGIT_COMMIT="727e454840df95fa792624251b70afa939186aa3"

DESCRIPTION=""
HOMEPAGE="https://github.com/kaldi-asr/kaldi"
SRC_URI="https://github.com/kaldi-asr/kaldi/archive/${EGIT_COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE=""
SLOT="0"
KEYWORDS=""
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
