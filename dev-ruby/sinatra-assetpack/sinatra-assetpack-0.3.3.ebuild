# Distributed under the terms of the GNU General Public License v2

EAPI=8
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Package your assets for Sinatra"
HOMEPAGE="http://github.com/rstacruz/sinatra-assetpack"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/jsmin-0"
ruby_add_rdepend ">=dev-ruby/rack-test-0"
ruby_add_rdepend ">=dev-ruby/sinatra-0"
ruby_add_rdepend ">=dev-ruby/tilt-1.3.0"
ruby_add_rdepend ">=dev-ruby/coffee-script-0"
ruby_add_rdepend ">=dev-ruby/haml-0"
ruby_add_rdepend ">=dev-ruby/less-0"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/stylus-0"
ruby_add_rdepend ">=dev-ruby/uglifier-0"
ruby_add_rdepend ">=dev-ruby/yui-compressor-0"

