# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="We want to play music at our office"
HOMEPAGE="https://github.com/holman/play"

LICENSE=""
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.2.2"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/activerecord-0"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"
ruby_add_rdepend "=dev-ruby/mustache-0.99.3"
ruby_add_rdepend ">=dev-ruby/SystemTimer-0"
ruby_add_rdepend ">=dev-ruby/ruby-audioinfo-0"
ruby_add_rdepend ">=dev-ruby/oa-oauth-0"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-0"
ruby_add_rdepend ">=dev-ruby/mysql2-0"
ruby_add_rdepend ">=dev-ruby/rb-fsevent-0"
ruby_add_rdepend ">=dev-ruby/fssm-0"
ruby_add_rdepend ">=dev-ruby/running_man-0"
ruby_add_rdepend ">=dev-ruby/mocha-0"

