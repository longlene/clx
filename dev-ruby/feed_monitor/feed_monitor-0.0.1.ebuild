# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Monitor RSS feeds for updates and send out email alerts for each updated item"
HOMEPAGE="http://brianjones.ca"

LICENSE="GPL-2.0"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10.1"
ruby_add_rdepend ">=dev-ruby/dm-core-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-migrations-1.2.0"
ruby_add_rdepend ">=dev-ruby/dm-sqlite-adapter-1.2.0"
ruby_add_rdepend ">=dev-ruby/pony-1.11.0"
ruby_add_rdepend ">=dev-ruby/feedjira-1.4.0"

