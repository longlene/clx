# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby19 ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Flok is a cross-platform application framework system that exports javascript files"
HOMEPAGE="https://github.com/sotownsend/flok"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/execjs-2.5"
ruby_add_rdepend ">=dev-ruby/bundler-1.6"
ruby_add_rdepend ">=dev-ruby/rspec-3.2"
ruby_add_rdepend ">=dev-ruby/webrick-1.3"
ruby_add_rdepend ">=dev-ruby/closure-compiler-1.1"
ruby_add_rdepend ">=dev-ruby/phantomjs-1.9"
ruby_add_rdepend ">=dev-ruby/pry-0.10"
ruby_add_rdepend ">=dev-ruby/rspec-wait-0.0"
ruby_add_rdepend "=dev-ruby/os-0.9.6"
ruby_add_rdepend ">=dev-ruby/boojs-0.0"
ruby_add_rdepend ">=dev-ruby/activesupport-4.2"
ruby_add_rdepend ">=dev-ruby/cakery-0.0"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/rake-10.3"
ruby_add_rdepend ">=dev-ruby/naturalsort-1.0"
ruby_add_rdepend ">=dev-ruby/awesome_print-1.6"
ruby_add_rdepend ">=dev-ruby/therubyracer-0.12"

