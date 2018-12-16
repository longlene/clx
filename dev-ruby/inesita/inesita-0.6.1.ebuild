# Distributed under the terms of the GNU General Public License v2

EAPI=5
USE_RUBY="ruby23 ruby24"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="Frontent web framework for Opal"
HOMEPAGE="http://github.com/inesita-rb/inesita"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~x86"
IUSE=""

ruby_add_rdepend ">=dev-ruby/opal-0.9"
ruby_add_rdepend ">=dev-ruby/opal-virtual-dom-0.5.0"
ruby_add_rdepend ">=dev-ruby/slim-3.0"
ruby_add_rdepend ">=dev-ruby/sass-3.4"
ruby_add_rdepend ">=dev-ruby/thor-0.19"
ruby_add_rdepend ">=dev-ruby/rack-rewrite-1.5"
ruby_add_rdepend ">=dev-ruby/listen-3.0"
ruby_add_rdepend ">=dev-ruby/bundler-1.0"
ruby_add_rdepend ">=dev-ruby/rspec-3.0"
ruby_add_rdepend ">=dev-ruby/opal-rspec-0.6.0"
ruby_add_rdepend ">=dev-ruby/rake-11.0"

