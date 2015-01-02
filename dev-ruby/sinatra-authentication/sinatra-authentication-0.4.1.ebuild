# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Simple authentication plugin for sinatra"
HOMEPAGE="http://github.com/maxjustus/sinatra-authentication"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/dm-core-0"
ruby_add_rdepend ">=dev-ruby/dm-migrations-0"
ruby_add_rdepend ">=dev-ruby/dm-validations-0"
ruby_add_rdepend ">=dev-ruby/dm-timestamps-0"
ruby_add_rdepend ">=dev-ruby/rufus-tokyo-0"
ruby_add_rdepend ">=dev-ruby/sinbook-0"
ruby_add_rdepend ">=dev-ruby/rack-flash-0"

