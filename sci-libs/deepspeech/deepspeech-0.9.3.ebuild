# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit vcs-snapshot

DESCRIPTION="A TensorFlow implementation of Baidu's DeepSpeech architecture"
HOMEPAGE="https://github.com/mozilla/DeepSpeech"
SRC_URI="https://github.com/mozilla/DeepSpeech/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
	media-libs/libpng
	media-sound/sox
	sci-libs/tensorflow
"
RDEPEND="${DEPEND}"
BDEPEND=""

src_prepare() {
	default
	sed -i '/SWIG_DIST_URL/,$d' native_client/definitions.mk
}

src_compile() {
	emake -C native_client
}
