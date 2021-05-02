# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sinatra Extension for working with DataMapper (another Sinatra-Sequel Rip-off)"
HOMEPAGE="http://github.com/kematzy/sinatra-dm"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend "=dev-ruby/dm-core-1.0.0"
ruby_add_rdepend ">=dev-ruby/kematzy-tasks-0"
ruby_add_rdepend "=dev-ruby/sinatra-tests-0.1.6"
ruby_add_rdepend "=dev-ruby/dm-migrations-1.0.0"

