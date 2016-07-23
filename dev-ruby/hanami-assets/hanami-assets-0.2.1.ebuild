# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Assets management for Ruby web applications"
HOMEPAGE="http://hanamirb.org"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/hanami-utils-0.7"
ruby_add_rdepend ">=dev-ruby/hanami-helpers-0.3"
ruby_add_rdepend ">=dev-ruby/tilt-2.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rake-10"
ruby_add_rdepend ">=dev-ruby/minitest-5"
ruby_add_rdepend ">=dev-ruby/yui-compressor-0.12"
ruby_add_rdepend ">=dev-ruby/uglifier-2.7"
ruby_add_rdepend ">=dev-ruby/closure-compiler-1.1"
ruby_add_rdepend ">=dev-ruby/sass-3.4"
ruby_add_rdepend ">=dev-ruby/coffee-script-2.3"
ruby_add_rdepend ">=dev-ruby/babel-transpiler-0.7"

