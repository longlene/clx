# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby25 ruby26"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="weixin api authorize access_token"
HOMEPAGE="https://github.com/lanrion/weixin_authorize"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rest-client-1.6.7"
ruby_add_rdepend ">=dev-ruby/redis-3.0.7"
ruby_add_rdepend ">=dev-ruby/carrierwave-0.10.0"
ruby_add_rdepend ">=dev-ruby/mini_magick-3.7.0"
ruby_add_rdepend ">=dev-ruby/yajl-ruby-1.2.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.3"
ruby_add_rdepend ">=dev-ruby/rake-0"

