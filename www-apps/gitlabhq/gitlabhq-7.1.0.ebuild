# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

USE_RUBY="ruby20"
PYTHON_DEPEND="2:2.7"

inherit eutils python ruby-ng versionator user

DESCRIPTION="GitLab is a free project and repository management application"
HOMEPAGE="https://github.com/gitlabhq/gitlabhq"
SRC_URI="https://github.com/gitlabhq/gitlabhq/archive/v$PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="7.1"
KEYWORDS="~amd64 ~x86"
IUSE="memcached mysql +postgres +unicorn"

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
	dev-ruby/rails
	dev-ruby/rails_autolink
	dev-ruby/default_value_for
	dev-ruby/devise
	dev-ruby/devise-async
	dev-ruby/omniauth
	dev-ruby/omniauth-twitter
	dev-ruby/omniauth-google-oauth2
	dev-ruby/omniauth-github
	dev-ruby/gitlab_git
	dev-ruby/gitlab-grack
	dev-ruby/gitlab_omniauth-ldap
	dev-ruby/gollum-lib
	dev-ruby/gitlab-linguist
	dev-ruby/grape
	dev-ruby/grape-entity
	dev-ruby/rack-cors
	dev-ruby/stamp
	dev-ruby/enumerize
	dev-ruby/kaminari
	dev-ruby/haml-rails
	dev-ruby/carrierwave
	dev-ruby/dropzonejs-rails
	dev-ruby/fog
	dev-ruby/unf
	dev-ruby/six
	dev-ruby/seed-fu
	dev-ruby/redcarpet
	dev-ruby/github-markup
	dev-ruby/org-ruby
	dev-ruby/diffy
	dev-ruby/asciidoctor
	unicorn? ( dev-ruby/unicorn-worker-killer )
	dev-ruby/state_machine
	dev-ruby/acts-as-taggable-on
	dev-ruby/slim
	dev-ruby/sinatra
	dev-ruby/sidekiq
	dev-ruby/httparty
	dev-ruby/colored
	dev-ruby/settingslogic
	dev-ruby/foreman
	dev-ruby/version_sorter
	dev-ruby/redis-rails
	dev-ruby/tinder
	dev-ruby/hipchat
	dev-ruby/gitlab-flowdock-git-hook
	dev-ruby/gemnasium-gitlab-service
	dev-ruby/slack-notifier
	dev-ruby/d3_rails
	dev-ruby/underscore-rails
	dev-ruby/sanitize
	dev-ruby/rack-attack
	dev-ruby/ace-rails-ap
	dev-ruby/semantic-ui-sass
	dev-ruby/sass-rails
	dev-ruby/coffee-rails
	dev-ruby/uglifier
	dev-ruby/turbolinks
	dev-ruby/jquery-turbolinks
	dev-ruby/select2-rails
	dev-ruby/jquery-atwho-rails
	dev-ruby/jquery-rails
	dev-ruby/jquery-ui-rails
	dev-ruby/jquery-scrollto-rails
	dev-ruby/raphael-rails
	dev-ruby/bootstrap-sass
	dev-ruby/font-awesome-rails
	dev-ruby/gitlab_emoji
	dev-ruby/gon
	dev-ruby/nprogress-rails
	dev-ruby/request_store
	dev-libs/icu
	dev-libs/libxml2
	dev-libs/libxslt
	dev-util/ragel
	dev-libs/yajl
	net-libs/nodejs
	postgres? ( dev-ruby/pg dev-db/postgresql-base )
	mysql? ( dev-ruby/mysql2 virtual/mysql )
	memcached? ( net-misc/memcached )"
DEPEND="${GEMS_DEPEND}
	$(ruby_implementation_depend ruby20 '=' -2.0.0*)[readline,ssl]
	>=dev-vcs/git-1.8.1.5
	>=dev-vcs/gitlab-shell-1.9.4
	net-misc/curl
	virtual/ssh"
RDEPEND="${DEPEND}
	dev-db/redis
	virtual/mta"
ruby_add_bdepend "
	virtual/rubygems
	>=dev-ruby/bundler-1.0"

#RUBY_PATCHES=(
#	"${P}-fix-checks-gentoo.patch"
#)

GIT_USER="git"
GIT_GROUP="git"
GIT_HOME=$(getent passwd $GIT_USER  | cut -d: -f6)
DEST_DIR="/opt/${PN}-${SLOT}"
CONF_DIR="/etc/${PN}-${SLOT}"

GIT_REPOS="${GIT_HOME}/repositories"
GIT_SATELLITES="${GIT_HOME}/gitlab-satellites"
GITLAB_SHELL="/var/lib/gitlab-shell"
GITLAB_SHELL_HOOKS="${GITLAB_SHELL}/hooks"

pkg_setup() {
	enewgroup ${GIT_GROUP}
	enewuser ${GIT_USER} -1 -1 ${DEST_DIR} "$GIT_GROUP}"
}

#all_ruby_unpack() {
#	git-2_src_unpack
#}

each_ruby_prepare() {

	# fix path to repo and gitlab-shell hooks
	test -d "${GITLAB_SHELL_HOOKS}" || die "Gitlab Shell hooks directory not found: \"${GITLAB_SHELL_HOOKS}. Have you properly installed dev-vcs/gitlab-shell"?

	sed -i \
		-e "s|\(\s*repos_path:\s\)/.*|\1 ${GIT_REPOS}/|" \
		-e "s|\(\s*hooks_path:\s\)/.*|\1 ${GITLAB_SHELL_HOOKS}/|" \
		-e "s|\(\s*path:\s\)/.*/gitlab-satellites/|\1 ${GIT_SATELLITES}/|" \
		-e "s|\(\s*GITLAB_SHELL:\s*\)|\1\n\tpath: \"${GITLAB_SHELL}\"|" \
		config/gitlab.yml.example || die "failed to filter gitlab.yml.example"

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
	#rm -r .git Satisfy gitlab::check.
	rm .foreman .gitignore Procfile .travis.yml
	use unicorn || rm config/unicorn.rb.example
	use postgres || rm config/database.yml.postgresql
	use mysql || rm config/database.yml.mysql

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
	sed -i -e '/i18n/ s/(0.6.9)//' Gemfile.lock
	sed -i -e '/tzinfo/ s/(1.2.1)//' Gemfile.lock
	sed -i -e '/activesupport/ s/(4.1.1)//' Gemfile.lock

	# change cache_store
	if use memcached; then
		sed -i \
			-e "/\w*config.cache_store / s/=.*/= :dalli_store, { namespace: 'gitlab' }/" \
			config/environments/production.rb \
			|| die "failed to modify production.rb"
	fi

	# Update pathes for unicorn
	if use unicorn; then
		sed -i \
			-e "s#/home/git/gitlab#${DEST_DIR}#" \
			config/unicorn.rb.example \
			|| die "failed to modify unicorn.rb.example"
	fi
}

each_ruby_install() {
	local dest="${DEST_DIR}"
	local conf="/etc/${PN}-${SLOT}"
	local temp="/var/tmp/${PN}-${SLOT}"
	local logs="/var/log/${PN}-${SLOT}"
	local uploads="${DEST_DIR}/public/uploads"

	## Prepare directories ##

	diropts -m750
	keepdir "${logs}"
	dodir "${temp}"

	diropts -m755
	keepdir "${conf}"
	dodir "${dest}"
	dodir "${uploads}"

	dosym "${temp}" "${dest}/tmp"
	dosym "${logs}" "${dest}/log"

	## Link gitlab-shell into git home
	dosym "${GITLAB_SHELL}" "${GIT_HOME}/gitlab-shell"

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
		"${FILESDIR}"/gitlab.logrotate > "${D}"/etc/logrotate.d/${PN}-${SLOT} \
		|| die "failed to filter gitlab.logrotate"

	## Install gems via bundler ##

	cd "${D}/${dest}"

	#local without="development test thin"
	#local flag; for flag in memcached mysql postgres unicorn; do
	#	without+="$(use $flag || echo ' '$flag)"
	#done
	#local bundle_args="--deployment ${without:+--without ${without}}"

	## Fix invalid ldflags for charlock_holmes, 
	## see https://github.com/brianmario/charlock_holmes/issues/32
	#${RUBY} /usr/bin/bundle config build.charlock_holmes --with-ldflags='-L. -Wl,-O1 -Wl,--as-needed -rdynamic -Wl,-export-dynamic -Wl,--no-undefined -lz -licuuc'

	#einfo "Running bundle install ${bundle_args} ..."
	#${RUBY} /usr/bin/bundle install ${bundle_args} || die "bundler failed"

	## Clean ##

	local gemsdir=vendor/bundle/ruby/$(ruby_rbconfig_value 'ruby_version')

	# remove gems cache
	rm -Rf ${gemsdir}/cache

	# fix permissions
	fowners -R ${GIT_USER}:${GIT_GROUP} "${dest}" "${conf}" "${temp}" "${logs}"
	#fperms +x script/rails
	fperms o+Xr "${temp}" # Let nginx access the unicorn socket

	## RC scripts ##
	local rcscript=${P}.init

	cp "${FILESDIR}/${rcscript}" "${T}" || die
	sed -i \
		-e "s|@GIT_USER@|${GIT_USER}|" \
		-e "s|@GIT_GROUP@|${GIT_USER}|" \
		-e "s|@SLOT@|${SLOT}|" \
		-e "s|@DEST_DIR@|${dest}|" \
		-e "s|@LOG_DIR@|${logs}|" \
		-e "s|@RESQUE_QUEUE@|${resque_queue}|" \
		"${T}/${rcscript}" \
		|| die "failed to filter ${rcscript}"

	if use memcached; then
		sed -i -e '/^depend/,// {/need / s/$/ memcached/}' \
		"${T}/${rcscript}" || die "failed to filter ${rcscript}"
	fi

	newinitd "${T}/${rcscript}" "${PN}-${SLOT}"
}

pkg_postinst() {
	if [ ! -e "${GIT_HOME}/.ssh/id_rsa" ]; then
		einfo "Generating SSH key for git user"
		su -l ${GIT_USER} -s /bin/sh -c "
			ssh-keygen -q -N '' -t rsa -f ${GIT_HOME}/.ssh/id_rsa" \
			|| die "failed to generate SSH key"
	fi
	if [ ! -e "${GIT_HOME}/.gitconfig" ]; then
		einfo "Setting git user in ${GIT_HOME}/.gitconfig, feel free to "
		einfo "modify this file according to your needs!"
		su -l ${GIT_USER} -s /bin/sh -c "
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
	elog "3. If this is a new installation, you should create database for your GitLab instance."
	elog
	if use postgres; then
		elog "  If you have local PostgreSQL running, just copy&run:"
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
	elog "4. Finally execute the following command to initlize or update the environment:"
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

	## Initialize app ##

	local RAILS_ENV=${RAILS_ENV:-production}
	local RUBY=${RUBY:-ruby20}
	#local BUNDLE="${RUBY} /usr/bin/bundle"

	# Ask user whether this is the first installation
	einfon "Do you want to upgrade an existing installation? [Y|n] "
	do_upgrade=""
	while true
	do
		read -r do_upgrade
		if [[ $do_upgrade == "n" || $do_upgrade == "N" ]] ; then do_upgrade="" && break
		elif [[ $do_upgrade == "y" || $do_upgrade == "Y" || $do_upgrade == "" ]] ; then do_upgrade=1 && break
		else eerrorn "Please type either \"Y\" or \"N\" ... " ; fi
	done

	if [[ $do_upgrade ]] ; then

		einfo "Migration database ..."
		su -l ${GIT_USER} -s /bin/sh -c "
		export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8
		cd ${DEST_DIR} 
		rake db:migrate RAILS_ENV=production
		rake gitlab:satellites:create RAILS_ENV=production" \
			|| die "failed to migrate database."

		einfo "Clear redis cache ..."
		su -l ${GIT_USER} -s /bin/sh -c "
		export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8
		cd ${DEST_DIR}
		rake cache:clear RAILS_ENV=production" \
			|| die "failed to run cache:clear"

		einfo "Clear and precompile assets ..."
		su -l ${GIT_USER} -s /bin/sh -c "
		export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8
		cd ${DEST_DIR}
		rake assets:clean RAILS_ENV=production
		rake assets:precompile RAILS_ENV=production" \
			|| die "failed to run assets:precompile"

	else

		einfo "Initializing database ..."
		su -l ${GIT_USER} -s /bin/sh -c "
		export LANG=en_US.UTF-8; export LC_ALL=en_US.UTF-8
		cd ${DEST_DIR}
		rake gitlab:setup RAILS_ENV=${RAILS_ENV}" \
			|| die "failed to run rake gitlab:setup"
	fi

	einfo "You might want to run the following in order to check your application status:"
	einfo "# cd ${DEST_DIR}"
	einfo "# rake gitlab:check RAILS_ENV=production"
	einfo ""
	einfo "GitLab is prepared, now you should configure your web server."
}
