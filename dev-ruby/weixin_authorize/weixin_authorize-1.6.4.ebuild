# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="weixin api authorize access_token"
HOMEPAGE="https://github.com/lanrion/weixin_authorize"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rest-client-1.6.7"
ruby_add_rdepend ">=dev-ruby/redis-3.1.0"
ruby_add_rdepend ">=dev-ruby/carrierwave-0.10.0"
ruby_add_rdepend ">=dev-ruby/mini_magick-3.7.0"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-1.2.0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/rake-0"
ruby_add_rdepend ">=dev-ruby/rspec-0"
ruby_add_rdepend ">=dev-ruby/redis-namespace-0"
ruby_add_rdepend ">=dev-ruby/codeclimate-test-reporter-0"
ruby_add_rdepend ">=dev-ruby/simplecov-0.10.0"
ruby_add_rdepend ">=dev-ruby/coveralls-0.8.2"
ruby_add_rdepend ">=dev-ruby/pry-rails-0"
ruby_add_rdepend ">=dev-ruby/pry-byebug-0"

