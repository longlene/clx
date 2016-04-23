# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Sprockets is a Rack-based asset packaging system that concatenates and serves JavaScript, CoffeeScript, CSS, LESS, Sass, and SCSS"
HOMEPAGE="https://github.com/rails/sprockets"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1"
ruby_add_rdepend ">=dev-ruby/concurrent-ruby-1.0"
ruby_add_rdepend ">=dev-ruby/closure-compiler-1.1"
ruby_add_rdepend ">=dev-ruby/coffee-script-source-1.6"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.2"
ruby_add_rdepend ">=dev-ruby/eco-1.0"
ruby_add_rdepend ">=dev-ruby/ejs-1.0"
ruby_add_rdepend ">=dev-ruby/execjs-2.0"
ruby_add_rdepend ">=dev-ruby/minitest-5.0"
ruby_add_rdepend ">=dev-ruby/nokogiri-1.3"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/sass-3.1"
ruby_add_rdepend ">=dev-ruby/uglifier-2.3"
ruby_add_rdepend ">=dev-ruby/yui-compressor-0.12"

