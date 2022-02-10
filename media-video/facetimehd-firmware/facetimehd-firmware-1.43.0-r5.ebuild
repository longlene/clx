# Copyright 2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Firmware for the Apple Facetime HD Camera"
HOMEPAGE="https://apple.com"
SRC_URI="https://updates.cdn-apple.com/2019/cert/041-88431-20191011-e7ee7d98-2878-4cd9-bc0a-d98b3a1e24b1/OSXUpd10.11.5.dmg"

LICENSE="as-is"
SLOT="0"
KEYWORDS="~amd64"

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

DEPEND="
	app-arch/cpio
	app-arch/gzip
	app-arch/xz-utils
	net-misc/curl
	sys-apps/coreutils
"

S=${WORKDIR}

CAM_IF_OFFSET="204909802"
CAM_IF_SIZE="2823322"
CAM_IF_FILE="AppleCameraInterface"
CAM_IF_PKG_PATH="./System/Library/Extensions/AppleCameraInterface.kext/Contents/MacOS/AppleCameraInterface"
CAM_IF_SHA256="f56e68a880b65767335071531a1c75f3cfd4958adc6d871adf8dbf3b788e8ee1"

FIRMWARE_OFFSET="81920"
FIRMWARE_SIZE="603715"
FIRMWARE_FILE="firmware.bin"
FIRMWARE_DIR="facetimehd"
FIRMWARE_SHA256="e3e6034a67dfdaa27672dd547698bbc5b33f47f1fc7f5572a2fb68ea09d32d3d"

src_unpack() {
	#dd bs=1 skip=${CAM_IF_OFFSET} count=${CAM_IF_SIZE} if="${DISTDIR}"/"${A}" | xzcat -q 2>/dev/null |\
	#		cpio -i --quiet --format odc --to-stdout --quiet ${CAM_IF_PKG_PATH} > ${CAM_IF_FILE}
	dd bs=1 skip=${CAM_IF_OFFSET} count=${CAM_IF_SIZE} if="${DISTDIR}"/"${A}" | xzcat -q 2>/dev/null |\
			cpio -i --format odc -d --quiet ${CAM_IF_PKG_PATH}
	mv ${CAM_IF_PKG_PATH} ${CAM_IF_FILE}
	echo "${CAM_IF_SHA256} ${CAM_IF_FILE}" | sha256sum -c || die "camera interface checksum mismatch"
	dd bs=1 skip=${FIRMWARE_OFFSET} count=${FIRMWARE_SIZE} if=${CAM_IF_FILE} | gunzip > ${FIRMWARE_FILE}
	echo "${FIRMWARE_SHA256} ${FIRMWARE_FILE}" | sha256sum -c || die "firmware checksum mismatch"
}

src_install() {
	insinto "/lib/firmware/${FIRMWARE_DIR}"
	doins $FIRMWARE_FILE
}
