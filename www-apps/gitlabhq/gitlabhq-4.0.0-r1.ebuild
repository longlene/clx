# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

# Mainteiner notes:
# - This ebuild uses Bundler to download and install all gems in deployment mode
#   (i.e. into isolated directory inside application). That's not Gentoo way how
#   it should be done, but GitLab has too many dependencies that it will be too
#   difficult to maintain them via ebuilds.
# - USE flags analytics and public-projects applies our custom patches, see
#   https://github.com/cvut/gitlabhq for more information.
#

USE_RUBY="ruby19"
PYTHON_DEPEND="2:2.5"

inherit eutils python ruby-ng

DESCRIPTION="GitLab is a free project and repository management application"
HOMEPAGE="https://github.com/gitlabhq/gitlabhq"
SRC_URI="https://github.com/gitlabhq/gitlabhq/archive/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="4.0"
KEYWORDS="~amd64 ~x86"
IUSE="analytics memcached mysql +perf-patch +postgres public-projects +unicorn"

## Gems dependencies:
#   charlock_holmes		dev-libs/icu
#	grape, capybara		dev-libs/libxml2, dev-libs/libxslt
#   json				dev-util/ragel
#   yajl-ruby			dev-libs/yajl
#   pygments.rb			python 2.5+
#   execjs				net-libs/nodejs, or any other JS runtime
#   pg					dev-db/postgresql-base
#   mysql				virtual/mysql
#
GEMS_DEPEND="
	dev-libs/icu
	dev-libs/libxml2
	dev-libs/libxslt
	dev-util/ragel
	dev-libs/yajl
	net-libs/nodejs
	postgres? ( dev-db/postgresql-base )
	mysql? ( virtual/mysql )
	memcached? ( net-misc/memcached )"
DEPEND="${GEMS_DEPEND}
	$(ruby_implementation_depend ruby19 '=' -1.9.3*)[readline,ssl,yaml]
	dev-vcs/git
	dev-vcs/gitolite[gitlab(-)]
	net-misc/curl
	virtual/ssh"
RDEPEND="${DEPEND}
	dev-db/redis
	virtual/mta"
ruby_add_bdepend "
	virtual/rubygems
	>=dev-ruby/bundler-1.0"

# Patches by Czech Technical University :)
RUBY_PATCHES=(
	"${P}-r1-fix-gemfile.patch"
	"${P}-fix-checks-gentoo.patch"
	"${P}-fix-passenger.patch"
)
use perf-patch && RUBY_PATCHES+=( "${P}-performance.patch" )
use public-projects && RUBY_PATCHES+=( "${P}-public-projects.patch" )
use postgres && RUBY_PATCHES+=( "${P}-fix-wiki-pg.patch" "${P}-fix-resque-pg.patch" )
use analytics && RUBY_PATCHES+=( "${P}-google-analytics.patch" )

MY_NAME="gitlab"
MY_USER="gitlab"
DEST_DIR="/opt/${MY_NAME}-${SLOT}"
CONF_DIR="/etc/${MY_NAME}-${SLOT}"

pkg_setup() {
    enewgroup ${MY_USER}
    enewuser ${MY_USER} -1 /bin/bash ${DEST_DIR} "${MY_USER}"
}

each_ruby_prepare() {

	# fix Gitolite paths
	local gitolite_repos=/var/lib/gitolite/repositories
	local gitolite_hooks=/var/lib/gitolite/.gitolite/hooks
	sed -i \
		-e "s|\(\s*repos_path:\s\)/home/git.*|\1${gitolite_repos}/|" \
		-e "s|\(\s*hooks_path:\s\)/home/git.*|\1${gitolite_hooks}/|" \
		config/gitlab.yml.example || die "failed to filter gitolite.yml.example"
	
	# modify database settings
	sed -i \
		-e 's|\(username:\) postgres.*|\1 gitlab|' \
		-e 's|\(password:\).*|\1 gitlab|' \
		-e 's|\(socket:\).*|/run/postgresql/.s.PGSQL.5432|' \
		config/database.yml.postgresql \
		|| die "failed to filter database.yml.postgresql"
	
	# replace "secret" token with random one
	local randpw=$(echo ${RANDOM}|sha512sum|cut -c 1-128)
	sed -i -e "/secret_token =/ s/=.*/= '${randpw}'/" \
		config/initializers/secret_token.rb \
		|| die "failed to filter secret_token.rb"
	
	# remove needless files
	rm .foreman .gitignore Procfile .travis.yml
	use unicorn || rm config/unicorn.rb.example
	use postgres || rm config/database.yml.postgresql
	use mysql || rm config/database.yml.mysql

	# remove zzet's stupid migration which expetcs that users are so foolish 
	# to use PostgreSQL's superuser in database.yml...
	rm db/migrate/20121009205010_postgres_create_integer_cast.rb

	# remove dependency on therubyracer and libv8 (we're using nodejs instead)
	local tfile; for tfile in Gemfile{,.lock}; do
		sed -i \
			-e '/therubyracer/d' \
			-e '/libv8/d' \
			"${tfile}" || die "failed to filter ${tfile}"
	done

	# change thin and unicorn dependencies to be optional
	sed -i \
		-e '/^gem "thin"/ s/$/, group: :thin/' \
		-e '/^gem "unicorn"/ s/$/, group: :unicorn/' \
		Gemfile || die "failed to modify Gemfile"
	
	# change cache_store
	if use memcached; then
		sed -i \
			-e "/\w*config.cache_store / s/=.*/= :dalli_store, { namespace: 'gitlab' }/" \
			config/environments/production.rb \
			|| die "failed to modify production.rb"
	fi
}

each_ruby_install() {
	local dest=${DEST_DIR}
	local conf=/etc/${MY_NAME}-${SLOT}
	local temp=/var/tmp/${MY_NAME}-${SLOT}
	local logs=/var/log/${MY_NAME}-${SLOT}

	## Prepare directories ##

	diropts -m750
	keepdir "${logs}"
	dodir "${temp}"

	diropts -m755
	keepdir "${conf}"
	dodir "${dest}" 

	dosym "${temp}" "${dest}/tmp"
	dosym "${logs}" "${dest}/log"

	## Install configs ##

	insinto "${conf}"
	doins -r config/*
	dosym "${conf}" "${dest}/config"

	insinto "${dest}/.ssh"
	newins "${FILESDIR}/config.ssh" config

	echo "export RAILS_ENV=production" > "${D}/${dest}/.profile"

	## Install all others ##

	# remove needless dirs
	rm -Rf config tmp log

	insinto "${dest}"
	doins -r ./

	## Install logrotate config ##

	dodir /etc/logrotate.d
	sed -e "s|@LOG_DIR@|${logs}|" \
		"${FILESDIR}"/gitlab.logrotate > "${D}"/etc/logrotate.d/${MY_NAME}-${SLOT} \
		|| die "failed to filter gitlab.logrotate"

	## Install gems via bundler ##

	cd "${D}/${dest}"

	local without="development test thin"
	local flag; for flag in memcached mysql postgres unicorn; do
		without+="$(use $flag || echo ' '$flag)"
	done
	local bundle_args="--deployment ${without:+--without ${without}}"

	einfo "Running bundle install ${bundle_args} ..."
	${RUBY} /usr/bin/bundle install ${bundle_args} || die "bundler failed"

	## Clean ##

	local gemsdir=vendor/bundle/ruby/$(ruby_rbconfig_value 'ruby_version')

	# remove gems cache
	rm -Rf ${gemsdir}/cache

	# fix permissions
	fowners -R ${MY_USER}:${MY_USER} "${dest}" "${conf}" "${temp}" "${logs}"
	fperms +x script/rails resque{,_dev}.sh

	## RC scripts ##

	local resque_queue="$(sed -ne 's/^.*QUEUE=\([^ ]*\) .*$/\1/p' resque.sh)"

	local rcscript=gitlab-support.init
	use unicorn && rcscript=gitlab-unicorn.init

	cp "${FILESDIR}/${rcscript}" "${T}" || die
	sed -i \
		-e "s|@USER@|${MY_USER}|" \
		-e "s|@GROUP@|${MY_USER}|" \
		-e "s|@SLOT@|${SLOT}|" \
		-e "s|@GITLAB_HOME@|${dest}|" \
		-e "s|@LOG_DIR@|${logs}|" \
		-e "s|@RESQUE_QUEUE@|${resque_queue}|" \
		"${T}/${rcscript}" \
		|| die "failed to filter ${rcscript}"

	if use memcached; then
		sed -i -e '/^depend/,// {/need / s/$/ memcached/}' \
		"${T}/${rcscript}" || die "failed to filter ${rcscript}"
	fi

	newinitd "${T}/${rcscript}" "${MY_NAME}-${SLOT}"
}

pkg_postinst() {
	if [ ! -e "${DEST_DIR}/.ssh/id_rsa" ]; then
		einfo "Generating SSH key for gitlab"
		su -l ${MY_USER} -c "
			ssh-keygen -q -N '' -t rsa -f ${DEST_DIR}/.ssh/id_rsa" \
			|| die "failed to generate SSH key"
	fi
	if [ ! -e "${DEST_DIR}/.gitconfig" ]; then
		einfo "Setting git user"
		su -l ${MY_USER} -c "
			git config --global user.email 'gitlab@localhost';
			git config --global user.name 'GitLab'" \
			|| die "failed to setup git name and email"
	fi
	
	elog
	elog "1. Copy ${CONF_DIR}/gitlab.yml.example to ${CONF_DIR}/gitlab.yml"
	elog "   and edit this file in order to configure your GitLab settings."
	elog
	elog "2. Copy ${CONF_DIR}/database.yml.* to ${CONF_DIR}/database.yml"
	elog "   and edit this file in order to configure your database settings"
	elog "   for \"production\" environment."
	elog
	elog "3. Then you should create database for your GitLab instance."
	elog
	if use postgres; then
        elog   "If you have local PostgreSQL running, just copy&run:"
        elog "      su postgres"
        elog "      psql -c \"CREATE ROLE gitlab PASSWORD 'gitlab' \\"
        elog "          NOSUPERUSER NOCREATEDB NOCREATEROLE INHERIT LOGIN;\""
        elog "      createdb -E UTF-8 -O gitlab gitlab_production"
		elog "  Note: You should change your password to something more random..."
		elog
 		elog "  GitLab uses polymorphic associations which are not SQL-standard friendly."
		elog "  To get it work you must use this ugly workaround:"
		elog "      psql -U postgres -d gitlab"
		elog "      CREATE CAST (integer AS text) WITH INOUT AS IMPLICIT;"
		elog
	fi
	elog "4. Finally execute the following command to initlize environment:"
	elog "       emerge --config \"=${CATEGORY}/${PF}\""
	elog "   Note: Do not forget to start Redis server."
	elog
}

pkg_config() {
	## Check config files existence ##

	einfo "Checking configuration files"

	if [ ! -r "${CONF_DIR}/database.yml" ] ; then
		eerror "Copy ${CONF_DIR}/database.yml.* to"
		eerror "${CONF_DIR}/database.yml and edit this file in order to configure your" 
		eerror "database settings for \"production\" environment."
		die
	fi
	if [ ! -r "${CONF_DIR}/gitlab.yml" ]; then
		eerror "Copy ${CONF_DIR}/gitlab.yml.example to ${CONF_DIR}/gitlab.yml"
		eerror "and edit this file in order to configure your GitLab settings"
		eerror "for \"production\" environment."
		die
	fi

	# read Gitolite base and hooks path from gitlab.yml
	local repos_path="$(sed -n \
		-e '/^gitolite:/,/^\w:/s/\s*repos_path:\s*\(.*\)\s*$/\1/p' \
		"${CONF_DIR}/gitlab.yml")"
	local hooks_path="$(sed -n \
		-e '/^gitolite:/,/^\w:/s/\s*hooks_path:\s*\(.*\)\s*$/\1/p' \
		"${CONF_DIR}/gitlab.yml")"
	local ssh_user="$(sed -n \
		-e '/^gitolite:/,/^\w:/s/\s*ssh_user:\s*\(.*\)\s*$/\1/p' \
		"${CONF_DIR}/gitlab.yml")"
	
	if [ -z "${hooks_path}" ] || [ -z "${repos_path}" ] || [ -z "${ssh_user}" ]; then
		eerror "Could not find repos_path, hooks_path or ssh_user in your gitlab.yml"
		die
	fi

	# check if Gitolite's repos_path is in its home
	local git_home=$(getent passwd ${ssh_user} | cut -d: -f6)
	if [ ! "$(dirname "${repos_path}")" -ef "${git_home}" ]; then
		eerror "Gitolite's repos_path from gitlab.yml is not in the HOME of"
		eerror "${ssh_user} user in passwd"; die
	fi

	# add git to gitlab group
	usermod -a -G ${ssh_user} ${MY_USER} \
		|| "failed to add ${ssh_user} to ${MY_USER} group"


	## Initialize Gitolite ##

	# if Gitolite is not initialized yet
	if [ ! -d "${repos_path}" ]; then
		# copy GitLab's SSH key
		cp "${DEST_DIR}/.ssh/id_rsa.pub" "${git_home}/gitlab.pub" \
			|| die "failed to copy GitLab's SSH key to ${git_home}"

		einfo "Initializing Gitolite"
		su -l ${ssh_user} -c "
			gitolite setup -pk ${git_home}/gitlab.pub" \
			|| die "failed to initialize Gitolite"

		rm "${git_home}/gitlab.pub"
	fi
	chmod -R ug+rwXs,o-rwx "${repos_path}" \
		|| die "failed to change permissions on ${repos_path}"
	chmod 750 "${repos_path}"/.gitolite \
		|| die "failed to change permissions on ${repos_path}/.gitolite"

	# copy git hook
	einfo "Copying git hook to ${hooks_path}"
	hooks_path+=/common
	cp ${DEST_DIR}/lib/hooks/post-receive "${hooks_path}" \
		|| die "failed to copy hook to ${hooks_path}"
	chown ${ssh_user}:${ssh_user} "${hooks_path}/post-receive" || die "failed to change perms"
	chmod 750 "${hooks_path}/post-receive" || die "failed to change perms"


	## Initialize app ##

	local RAILS_ENV=${RAILS_ENV:-production}
	local RUBY=${RUBY:-ruby19}
	local BUNDLE="${RUBY} /usr/bin/bundle"

	einfo "Initializing database ..."
	su -l ${MY_USER} -c "
		export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8
		cd ${DEST_DIR}
		${BUNDLE} exec rake gitlab:app:setup RAILS_ENV=${RAILS_ENV}" \
		|| die "failed to run rake gitlab:app:setup"
	
	einfo "Precompiling assests ..."
	su -l ${MY_USER} -c "
		export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8
		cd ${DEST_DIR}
		${BUNDLE} exec rake assets:precompile:all RAILS_ENV=${RAILS_ENV}" \
		|| die "failed to precompile assets"
}
