# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="API, command and message handling for WeChat in Rails"
HOMEPAGE="https://github.com/Eric-Guo/wechat"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/activesupport-3.2"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.6.0"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/http-1.0.4"
ruby_add_rdepend ">=dev-ruby/rspec-rails-3.5"
ruby_add_rdepend ">=dev-ruby/rails-5"
ruby_add_rdepend ">=dev-ruby/sqlite3-0"

