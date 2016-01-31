# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

USE_RUBY="ruby20"

inherit eutils ruby-ng user

DESCRIPTION="GitLab Shell is a free SSH access and repository management application"
HOMEPAGE="https://github.com/gitlabhq/gitlab-shell"
SRC_URI="https://github.com/gitlabhq/gitlab-shell/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="$(ruby_implementation_depend ruby20 '=' -2.0.0*)
	dev-vcs/git
	virtual/ssh
	dev-db/redis"
RDEPEND="${DEPEND}"

GIT_USER="git"
GIT_GROUP="git"
HOME="/var/lib/git"
REPO_DIR="${HOME}/repositories"
AUTH_FILE="${HOME}/.ssh/authorized_keys"
KEY_DIR=$(dirname "${AUTH_FILE}")
DEST_DIR="/var/lib/${PN}"

pkg_setup() {

	enewgroup ${GIT_GROUP}
	enewuser ${GIT_USER} -1 -1 "${HOME}" ${GIT_GROUP}
}

all_ruby_prepare() {
	sed -i \
		-e "s|\(user:\).*|\1 ${GIT_USER}|" \
		-e "s|\(repos_path:\).*|\1 \"${REPO_DIR}\"|" \
		-e "s|\(auth_file:\).*|\1 \"${AUTH_FILE}\"|" \
		config.yml.example || die "failed to filter config.example.yml"
}

all_ruby_install() {

	rm -Rf .gitignore .rspec .travis.yml

	insinto ${DEST_DIR}
	touch gitlab-shell.log
	doins -r . || die

	dosym ${DEST_DIR}/bin/gitlab-keys /usr/bin/gitlab-keys || die
	dosym ${DEST_DIR}/bin/gitlab-projects /usr/bin/gitlab-projects || die
	dosym ${DEST_DIR}/bin/gitlab-shell /usr/bin/gitlab-shell || die
	dosym ${DEST_DIR}/bin/check /usr/bin/gitlab-check || die

	fperms 0755 ${DEST_DIR}/bin/gitlab-keys || die
	fperms 0755 ${DEST_DIR}/bin/gitlab-projects || die
	fperms 0755 ${DEST_DIR}/bin/gitlab-shell || die
	fperms 0755 ${DEST_DIR}/bin/check || die
	fperms 0755 ${DEST_DIR}/hooks/update || die
	fowners ${GIT_USER} ${DEST_DIR}/gitlab-shell.log
}

pkg_postinst() {

	dodir "${REPO_DIR}" || die

	if [[ ! -d "${KEY_DIR}" ]] ; then
		mkdir "${KEY_DIR}" || die
		chmod 0700 "${KEY_DIR}" || die
		chown ${GIT_USER}:${GIT_GROUP} "${KEY_DIR}" -R || die
	fi

	if [[ ! -e "${AUTH_FILE}" ]] ; then
		touch "${AUTH_FILE}" || die
		chmod 0600 "${AUTH_FILE}" || die
		chown ${GIT_USER}:${GIT_GROUP} "${AUTH_FILE}" || die
	fi

	if [[ ! -d "${REPO_DIR}" ]] ; then
		mkdir "${REPO_DIR}"
		chmod ug+rwX,o-rwx "${REPO_DIR}" -R || die
		chmod ug-s,o-rwx "${REPO_DIR}" -R || die
		chown ${GIT_USER}:${GIT_GROUP} "${REPO_DIR}" -R || die
	fi

	elog "Copy ${DEST_DIR}/config.example.yml to ${DEST_DIR}/config.yml"
	elog "and edit this file in order to configure your GitLab-Shell settings."
}
