# Distributed under the terms of the GNU General Public License v2

EAPI=7
USE_RUBY="ruby31 ruby32"

RUBY_FAKEGEM_TASK_DOC=""
RUBY_FAKEGEM_EXTRADOC="README.md"
RUBY_FAKEGEM_GEMSPEC=${PN}.gemspec

inherit ruby-fakegem

DESCRIPTION="A light-weight Sinatra-inspired web framework for web sites and applications of any size"
HOMEPAGE="http://scorchedrb.com"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~x86 ~amd64 ~arm"
IUSE=""

ruby_add_rdepend ">=dev-ruby/rack-1.4"
ruby_add_rdepend ">=dev-ruby/rack-accept-0.4"
ruby_add_rdepend ">=dev-ruby/scorched-accept-0.1"
ruby_add_rdepend ">=dev-ruby/tilt-1.4"
ruby_add_rdepend ">=dev-ruby/rack-test-0.6"
ruby_add_rdepend ">=dev-ruby/rspec-2.9"
ruby_add_rdepend ">=dev-ruby/rake-10.4"

