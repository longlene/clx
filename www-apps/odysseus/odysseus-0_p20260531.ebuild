# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{13,14} )

inherit python-single-r1

DESCRIPTION="Self-hosted AI workspace with multi-provider LLM chat and agent tools"
HOMEPAGE="https://github.com/pewdiepie-archdaemon/odysseus"

EGIT_COMMIT="051751adcda2f5177e11ba18b32965f67933c712"
SRC_URI="https://github.com/pewdiepie-archdaemon/odysseus/archive/${EGIT_COMMIT}.tar.gz -> ${P}.gh.tar.gz"

S="${WORKDIR}/${PN}-${EGIT_COMMIT}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="test"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/bcrypt[${PYTHON_USEDEP}]
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/charset-normalizer[${PYTHON_USEDEP}]
		dev-python/croniter[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/icalendar[${PYTHON_USEDEP}]
		dev-python/markdown[${PYTHON_USEDEP}]
		dev-python/mcp[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pydantic-settings[${PYTHON_USEDEP}]
		dev-python/pypdf[${PYTHON_USEDEP}]
		dev-python/pyotp[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		dev-python/python-multipart[${PYTHON_USEDEP}]
		dev-python/qrcode[${PYTHON_USEDEP}]
		dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/youtube-transcript-api[${PYTHON_USEDEP}]
		sci-ml/chromadb[${PYTHON_USEDEP}]
	')
"

src_install() {
	python_setup
	local appdir="/usr/share/${PN}"

	insinto "${appdir}"
	doins app.py
	doins -r config core mcp_servers routes scripts services src static

	# Launcher for the web server
	local ui_launcher="${T}/${PN}-ui"
	cat > "${ui_launcher}" <<-EOF || die
		#!/bin/sh
		cd "${appdir}" || exit 1
		exec "${EPYTHON}" -m uvicorn app:app "\$@"
	EOF
	dobin "${ui_launcher}"

	# Wrapper for the CLI dispatcher (scripts/odysseus uses __file__ to find siblings)
	local cli_launcher="${T}/${PN}"
	cat > "${cli_launcher}" <<-EOF || die
		#!/bin/sh
		exec "${EPYTHON}" "${appdir}/scripts/${PN}" "\$@"
	EOF
	dobin "${cli_launcher}"

	einstalldocs
}

pkg_postinst() {
	elog "Odysseus is installed to /usr/share/${PN}."
	elog "Start the web server with: odysseus-ui --host 0.0.0.0 --port 7000"
	elog "CLI tools are available via: odysseus <subcommand>"
	elog ""
	elog "Create /etc/${PN}.env for environment overrides (AUTH_ENABLED,"
	elog "DATABASE_URL, ODYSSEUS_ADMIN_PASSWORD, etc.)."
	elog ""
	ewarn "Missing optional dependencies (not in portage):"
	ewarn "  caldav    -- CalDAV sync; install via: pip install caldav"
	ewarn "  fastembed -- local ONNX embeddings; install via: pip install fastembed"
}
