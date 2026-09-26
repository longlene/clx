# Copyright 2025-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13..15} )

inherit cmake python-any-r1 systemd

# Python ports of the C# actor compiler and vexillographer from upstream
# main (apple/foundationdb#12559, #12615); used instead of mono
PYPORT_COMMIT="31d7eadd52f6c6b5e275186c855c05dcfc360ca2"
PYPORT_URI="https://raw.githubusercontent.com/apple/foundationdb/${PYPORT_COMMIT}"
PYPORT_ACTOR_FILES=( __main__.py errors.py parse_tree.py actor_parser.py actor_compiler.py )

BOOST_PV="1.78.0"
MSGPACK_PV="3.3.0"
TOML11_PV="3.4.0"
DOCTEST_PV="2.4.8"

DESCRIPTION="A distributed, transactional key-value store"
HOMEPAGE="https://github.com/apple/foundationdb"
SRC_URI="
	https://github.com/apple/foundationdb/archive/refs/tags/${PV}.tar.gz -> ${P}.gh.tar.gz
	${PYPORT_URI}/fdbclient/vexillographer/vexillographer.py
		-> ${PN}-${PYPORT_COMMIT:0:10}-vexillographer.py
	https://archives.boost.io/release/${BOOST_PV}/source/boost_${BOOST_PV//./_}.tar.bz2
	https://github.com/msgpack/msgpack-c/releases/download/cpp-${MSGPACK_PV}/msgpack-${MSGPACK_PV}.tar.gz
	https://github.com/ToruNiina/toml11/archive/v${TOML11_PV}.tar.gz -> toml11-${TOML11_PV}.gh.tar.gz
	https://github.com/doctest/doctest/archive/v${DOCTEST_PV}.tar.gz -> doctest-${DOCTEST_PV}.gh.tar.gz
"
for _f in "${PYPORT_ACTOR_FILES[@]}"; do
	SRC_URI+=" ${PYPORT_URI}/flow/actorcompiler_py/${_f} -> ${PN}-${PYPORT_COMMIT:0:10}-actorcompiler-${_f}"
done
unset _f

LICENSE="Apache-2.0 Boost-1.0 MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="+jemalloc"
# tests need the C# TestHarness (mono)
RESTRICT="test"

DEPEND="
	dev-libs/openssl:=
	virtual/zlib:=
	jemalloc? ( dev-libs/jemalloc:= )
"
RDEPEND="
	${DEPEND}
	acct-group/foundationdb
	acct-user/foundationdb
"
BDEPEND="${PYTHON_DEPS}"

PATCHES=(
	"${FILESDIR}"/${P}-no-mono.patch
	"${FILESDIR}"/${P}-actorcompiler-py-7.3.patch
	"${FILESDIR}"/${P}-open-mode.patch
)

src_unpack() {
	unpack ${P}.gh.tar.gz doctest-${DOCTEST_PV}.gh.tar.gz

	local f
	mkdir -p "${S}"/flow/actorcompiler_py || die
	for f in "${PYPORT_ACTOR_FILES[@]}"; do
		cp "${DISTDIR}"/${PN}-${PYPORT_COMMIT:0:10}-actorcompiler-${f} \
			"${S}"/flow/actorcompiler_py/${f} || die
	done
	cp "${DISTDIR}"/${PN}-${PYPORT_COMMIT:0:10}-vexillographer.py \
		"${S}"/fdbclient/vexillographer/vexillographer.py || die
}

src_prepare() {
	cmake_src_prepare

	# bundled third-party projects are fetched at build time; point them at DISTDIR
	sed -i -e "s|\"https://archives.boost.io/.*\.tar\.bz2\"|\"${DISTDIR}/boost_${BOOST_PV//./_}.tar.bz2\"|" \
		cmake/CompileBoost.cmake || die
	sed -i -e "s|\"https://github.com/msgpack/.*\.tar\.gz\"|\"${DISTDIR}/msgpack-${MSGPACK_PV}.tar.gz\"|" \
		cmake/GetMsgpack.cmake || die
	sed -i -e "s|\"https://github.com/ToruNiina/.*\.tar\.gz\"|\"${DISTDIR}/toml11-${TOML11_PV}.gh.tar.gz\"|" \
		-e "s|-Dtoml11_BUILD_TEST:BOOL=OFF|&\n      -DCMAKE_POLICY_VERSION_MINIMUM:STRING=3.5|" \
		cmake/FDBComponents.cmake || die
	sed -i -e "s|/opt/doctest_proj_2.4.8|${WORKDIR}/doctest-${DOCTEST_PV}|" \
		-e "/add_dependencies(doctest doctest_proj)/d" \
		bindings/c/test/unit/third_party/CMakeLists.txt || die
	# the bundled fmt is not installed; link it statically
	sed -i -e 's|^  add_subdirectory(fmt-8.1.1)|  set(BUILD_SHARED_LIBS OFF)\n&|' contrib/CMakeLists.txt || die
	# link the system OpenSSL dynamically
	sed -i -e '/set(OPENSSL_USE_STATIC_LIBS TRUE)/d' cmake/FDBComponents.cmake || die
}

src_configure() {
	local mycmakeargs=(
		-DPython3_EXECUTABLE="${PYTHON}"
		-DUSE_JEMALLOC=$(usex jemalloc)
		-DUSE_CUSTOM_JEMALLOC=OFF
		-DFORCE_BOOST_BUILD=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_toml11=ON
		-DCMAKE_DISABLE_FIND_PACKAGE_fmt=ON
		-DSSD_ROCKSDB_EXPERIMENTAL=OFF
		-DBUILD_AWS_BACKUP=OFF
		-DBUILD_FLOWBENCH=OFF
		-DBUILD_JAVA_BINDING=OFF
		-DBUILD_GO_BINDING=OFF
		-DBUILD_RUBY_BINDING=OFF
		-DBUILD_PYTHON_BINDING=OFF
		-DBUILD_DOCUMENTATION=OFF
	)
	cmake_src_configure
}

src_install() {
	# every file is installed once per cpack package flavour (tgz, deb, el7,
	# versioned); install only the el7 (FHS, lib64) client and server sets
	local c
	for c in clients-el7 server-el7; do
		DESTDIR="${D}" cmake --install "${BUILD_DIR}" --prefix / --component ${c} \
			|| die "installing component ${c} failed"
	done

	systemd_dounit "${ED}"/lib/systemd/system/foundationdb.service
	rm -r "${ED}"/lib || die

	keepdir /var/lib/foundationdb/data /var/log/foundationdb

	einstalldocs
}

pkg_postinst() {
	chown -R foundationdb:foundationdb \
		"${EROOT}"/var/lib/foundationdb "${EROOT}"/var/log/foundationdb || die

	local cluster="${EROOT}/etc/foundationdb/fdb.cluster"
	if [[ ! -e ${cluster} ]]; then
		# same default as upstream's deb/rpm postinst: a single local node
		local desc id
		desc=$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom | head -c 8)
		id=$(LC_ALL=C tr -dc 'a-z0-9' </dev/urandom | head -c 8)
		echo "${desc}:${id}@127.0.0.1:4500" > "${cluster}" || die
		chown foundationdb:foundationdb "${cluster}" || die
		chmod 0664 "${cluster}" || die
		elog "Created ${cluster} for a single local node. For a new database run:"
		elog "  fdbcli --exec 'configure new single ssd'"
	fi
}
