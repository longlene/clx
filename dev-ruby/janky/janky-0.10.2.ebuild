# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Janky is a Continuous Integration server"
HOMEPAGE="https://github.com/github/janky"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rake-0.9.2"
ruby_add_rdepend ">=dev-ruby/sinatra-1.3"
ruby_add_rdepend ">=dev-ruby/sinatra_auth_github-1.0.0"
ruby_add_rdepend ">=dev-ruby/mustache-0.11"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-1.1.0"
ruby_add_rdepend ">=dev-ruby/activerecord-3.2.0"
ruby_add_rdepend ">=dev-ruby/broach-0.2"
ruby_add_rdepend ">=dev-ruby/replicate-1.4"
ruby_add_rdepend ">=dev-ruby/shotgun-0.9"
ruby_add_rdepend ">=dev-ruby/thin-1.2"
ruby_add_rdepend ">=dev-ruby/mysql2-0.3.0"
ruby_add_rdepend ">=dev-ruby/database_cleaner-0.6"
ruby_add_rdepend ">=dev-ruby/mocha-0.10.4"

