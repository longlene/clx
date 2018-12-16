# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Backup and restore your Redis data to and from JSON"
HOMEPAGE="http://github.com/delano/redis-dump"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/yajl-ruby-0.1"
ruby_add_rdepend ">=dev-ruby/redis-2.0"
ruby_add_rdepend ">=dev-ruby/uri-redis-0.4.0"
ruby_add_rdepend ">=dev-ruby/drydock-0.6.9"

