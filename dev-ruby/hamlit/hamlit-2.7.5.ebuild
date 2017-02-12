# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby20 ruby21 ruby22 ruby23"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="High Performance Haml Implementation"
HOMEPAGE="https://github.com/k0kubun/hamlit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/temple-0.7.6"
ruby_add_rdepend ">=dev-ruby/thor-0"
ruby_add_rdepend ">=dev-ruby/tilt-0"
ruby_add_rdepend ">=dev-ruby/bundler-0"
ruby_add_rdepend ">=dev-ruby/coffee-script-0"
ruby_add_rdepend ">=dev-ruby/erubis-0"
ruby_add_rdepend "=dev-ruby/haml-4.1.0"
ruby_add_rdepend ">=dev-ruby/less-0"
ruby_add_rdepend ">=dev-ruby/minitest-reporters-1.1"
ruby_add_rdepend ">=dev-ruby/rails-4.0.0"
ruby_add_rdepend ">=dev-ruby/rake-10.0"
ruby_add_rdepend ">=dev-ruby/rake-compiler-0"
ruby_add_rdepend ">=dev-ruby/redcarpet-0"
ruby_add_rdepend ">=dev-ruby/sass-0"
ruby_add_rdepend ">=dev-ruby/slim-0"
ruby_add_rdepend ">=dev-ruby/unindent-0"

